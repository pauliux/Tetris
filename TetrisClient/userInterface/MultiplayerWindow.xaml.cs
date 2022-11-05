﻿using System;
using System.Media;
using System.Reflection.Emit;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;
using Microsoft.AspNetCore.SignalR.Client;
using Newtonsoft.Json;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Tetromino;
using static System.Formats.Asn1.AsnWriter;
using TetrisClient.gameLogic.Facade;
using TetrisClient.gameLogic.Strategy;

namespace TetrisClient
{
    public partial class MultiplayerWindow
    {
        private HubConnection _connection;
        private TetrisEngine _engine = new();
        private DispatcherTimer _renderTimer;

        private readonly SoundPlayer _sound1 = new(Resource1.Sound1);
        private readonly SoundPlayer _sound2 = new(Resource1.Sound2);

        private int[,] _enemyBoard;
        private TetrominoJsonObject _enemyTetromino;
        private TetrominoJsonObject _enemyNextTetromino;
        private Score _enemyScore;
        private bool _enemyGameOver;

        public MultiplayerWindow()
        {
            InitializeComponent();

            // Url that TetrisHub will run on.
            const string url = "http://127.0.0.1:5000/TetrisHub";

            // The Builder that helps us create the connection.
            _connection = new HubConnectionBuilder()
                .WithUrl(url)
                .WithAutomaticReconnect()
                .Build();

            CreateSubscriptions();

            // It is mandatory that the connection is started *after* all event listeners are set.
            // If the method this occurs in happens to be `async`, Task.Run can be removed.
            // It is necessary because of the constructor.
            Task.Run(async () => await _connection.StartAsync());
        }

        /// <summary>
        /// Generates a seed and fires the ReadyUp event.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private async void StartGame_OnClick(object sender, RoutedEventArgs e)
        {
            // If the connection isn't initialized, nothing can be sent to it.
            if (_connection.State != HubConnectionState.Connected) return;
            var seed = Guid.NewGuid().GetHashCode();

            // Calls `ReadyUp` from the TetrisHub.cs and gives the int it expects
            await _connection.InvokeAsync("ReadyUp", seed);
        }


        /// <summary>
        /// Sets all the needed substriptions
        /// </summary>
        private void CreateSubscriptions()
        {
            // The first parameter has to be the same as the one in TetrisHub.cs
            // The type specified between <..> determines what the type of the parameter `seed` is.
            // This way the code below corresponds with the method in TetrisHub.cs
            _connection.On<int>("ReadyUp", seed =>
                Task.Run(async () => await _connection.InvokeAsync("StartGame", seed)));
            _connection.On<int>("StartGame", seed => Dispatcher.BeginInvoke(new Action(() =>
                StartGame(seed))));
            _connection.On<string>("SendBoard", board => Dispatcher.BeginInvoke(new Action(() =>
                _enemyBoard = JsonConvert.DeserializeObject<int[,]>(board))));
            _connection.On<string>("SendTetromino", tetromino => Dispatcher.BeginInvoke(new Action(() =>
                _enemyTetromino = JsonConvert.DeserializeObject<TetrominoJsonObject>(tetromino))));
            _connection.On<string>("SendNextTetromino", tetromino => Dispatcher.BeginInvoke(new Action(() =>
                _enemyNextTetromino = JsonConvert.DeserializeObject<TetrominoJsonObject>(tetromino))));
            _connection.On<string>("SendScore", score => Dispatcher.BeginInvoke(new Action(() =>
               GetEnemyScore(score))));
            _connection.On<bool>("SendIsGameOver", status => Dispatcher.BeginInvoke(new Action(() =>
                _enemyGameOver = status)));
        }

        private void GetEnemyScore(String score)
        {
            _enemyScore = JsonConvert.DeserializeObject<Score>(score);
            if (_enemyScore != null && _enemyScore.Level > _engine.Score.Level)
            {
                _engine.Score.ForceLevelUpdate = true;
            }
        }

        private void StartGame(int seed)
        {
            Dispatcher.Invoke(() => { ReadyButton.Visibility = Visibility.Hidden; });
            Dispatcher.Invoke(() => { ReadyButton.Visibility = Visibility.Hidden; });
            _engine.StartGame(seed);
            Timer();
        }

        private void StopGame()
        {
            _engine.StopGame();
        }

        /// <summary>
        /// Start a DispatcherTimer because those don't interrupt the program
        /// This timer is only used for rendering, it matches the speed of the engine timer
        /// </summary>
        private void Timer()
        {
            _renderTimer = new DispatcherTimer();
            _renderTimer.Tick += dispatcherTimer_Tick;
            _renderTimer.Interval = new TimeSpan(0, 0, 0, 0, 10);
            _renderTimer.Start();
        }

        /// <summary>
        /// Starts a dispatcherTimer because those are non blocking.
        /// This timer is used to determine the speed at which tetromino's
        /// are falling 
        /// </summary>
        /// <param name="sender"></param> 
        /// <param name="e"></param>
        private void dispatcherTimer_Tick(object sender, EventArgs e) => UpdateGame();

        /// <summary>
        /// Updates all game info
        /// Stops the timer when the game is lost, also shows the gameOverText
        /// Sets the interval of the _renderTimer to the same speed as the game engine speed
        /// Sets all score texts to their corresponding value
        /// Renders all tetromino's
        /// </summary>
        private void UpdateGame()
        {
            SendData();
            CheckGameOver();
            SetTextBlocks();
            RenderGrid();
            SetBombButton();
        }

        private void SetBombButton()
        {
            Bombs bomb = _engine.GetBomb();
            Facade facade = new Facade(bomb);
            if (_engine.Score.Points >= 200)
            {
                BombButton.IsEnabled = true;
                //BombButtonImage.Source = new BitmapImage(new Uri(bomb.GetImageEnabled(), UriKind.Relative));
                BombButtonImage.Source = new BitmapImage(new Uri(FacadeClient.ClientEnableBomb(facade), UriKind.Relative));
            }
            else
            {
                BombButton.IsEnabled = false;
                //BombButtonImage.Source = new BitmapImage(new Uri(bomb.GetImageDisabled(), UriKind.Relative));
                BombButtonImage.Source = new BitmapImage(new Uri(FacadeClient.ClientDisableBomb(facade), UriKind.Relative));
            }
        }
        /// <summary>
        /// Sends all the required data to the server so it can dispatch it to the other client.
        /// </summary>
        private void SendData()
        {
            Task.Run(async () =>
                await _connection.InvokeAsync("SendScore", JsonConvert.SerializeObject(_engine.Score)));
            Task.Run(async () =>
                await _connection.InvokeAsync("SendBoard", JsonConvert.SerializeObject(TetrisEngine.Representation.Board)));
            Task.Run(async () =>
                await _connection.InvokeAsync("SendTetromino", JsonConvert.SerializeObject(TetrisEngine.Tetromino)));
            Task.Run(async () =>
                await _connection.InvokeAsync("SendIsGameOver", _engine.GameOver));
            Task.Run(async () =>
                await _connection.InvokeAsync("SendNextTetromino", JsonConvert.SerializeObject(_engine.NextTetromino)));
        }


        /// <summary>
        /// Checks if either one of the players is game over and if so, displays the game over message.
        /// </summary>
        private void CheckGameOver()
        {
            if (_engine.GameOver)
            {
                Dispatcher.Invoke(() => { GameOverTextP1.Visibility = Visibility.Visible; });
                Dispatcher.Invoke(() => { YouWonTextP2.Visibility = Visibility.Visible; });
            }

            if (_enemyGameOver)
            {
                Dispatcher.Invoke(() => { GameOverTextP2.Visibility = Visibility.Visible; });
                Dispatcher.Invoke(() => { YouWonTextP1.Visibility = Visibility.Visible; });
                StopGame();
            }
        }

        private void SetTextBlocks()
        {
            LevelTextBlockP1.Text = $"{_engine.Score.Level}";
            ScoreTextBlockP1.Text = $"{_engine.Score.Points}";
            LinesTextBlockP1.Text = $"{_engine.Score.Rows}";

            if (_enemyScore == null) return;
            LevelTextBlockP2.Text = $"{_enemyScore.Level}";
            ScoreTextBlockP2.Text = $"{_enemyScore.Points}";
            LinesTextBlockP2.Text = $"{_enemyScore.Rows}";
        }

        /// <summary>
        /// Renders all landed tetrominos, the falling tetromino and the next tetromino
        /// </summary>
        private void RenderGrid()
        {
            TetrisGridP1.Children.Clear();
            RenderLandedTetrominos(TetrisGridP1);

            if (_enemyBoard != null)
            {
                TetrisGridP2.Children.Clear();
                RenderLandedTetrominos(TetrisGridP2, _enemyBoard);
            }

            RenderTetromino(TetrisEngine.Tetromino, TetrisGridP1);
            RenderTetromino(_engine.CreateGhostTetromino(), TetrisGridP1, 0.30);

            if (_enemyTetromino != null)
                RenderTetromino(_enemyTetromino, TetrisGridP2);


            NextGridP1.Children.Clear();
            RenderTetromino(_engine.NextTetromino, NextGridP1);

            if (_enemyNextTetromino == null) return;
            NextGridP2.Children.Clear();
            RenderTetromino(_enemyNextTetromino, NextGridP2);
        }

        /// <summary>
        /// Constructs the given tetromino by getting the int[,] from the matrix. For each cell that
        /// is '0' it creates nothing because that should be empty. For every number that is not 0 a block will be drawn.
        /// Then creates a rectangle of the mapped tetromino and places it in the given grid (trough) param.
        /// </summary>
        /// <param name="tetromino"></param>
        /// <param name="grid">TetrisGrid or NextGrid for next tetromino</param>
        /// <param name="opacity">Opacity, used for rendering a ghost tetromino</param>
        private void RenderTetromino(Tetromino tetromino, Panel grid, double opacity = 1)
        {
            tetromino.CalculatePositions().ForEach(coordinate =>
            {
                var (y, x) = coordinate;
                var shapeRectangle = tetromino.Matrix.Value[y - tetromino.OffsetY, x - tetromino.OffsetX];
                var rectangle = CreateRectangle(TetrominoBrushes.BrushArray[shapeRectangle], opacity);
                grid?.Children.Add(rectangle);

                Grid.SetRow(rectangle, y);
                Grid.SetColumn(rectangle, grid != NextGridP1 && grid != NextGridP2 ? x : x - 4);
            });
        }

        private void RenderTetromino(TetrominoJsonObject tetromino, Panel grid, double opacity = 1)
        {
            Creator creator = new LevelCreator();
            Level level = creator.GetLevel(_enemyScore.Level);
            AbstractFactory abstractFactory = level.GetAbstractFactory();
            Tetromino generatedTetromino = (Tetromino)abstractFactory.getTetromino(tetromino.OffsetX, tetromino.OffsetY, tetromino.Matrix);
            RenderTetromino(generatedTetromino, grid, opacity);
        }

        /// <summary>
        /// Renders all tetrominos that are in the representation
        /// </summary>
        private void RenderLandedTetrominos(Panel grid, int[,] board = null)
        {
            board ??= TetrisEngine.Representation.Board;

            for (var y = 0; y < board.GetLength(0); y++)
                for (var x = 0; x < board.GetLength(1); x++)
                {
                    var block = board[y, x];
                    if (block == 0) continue; //block does not need to be rendered when it is 0 because its empty

                    var rectangle = CreateRectangle(TetrominoBrushes.BrushArray[board[y, x]]);
                    grid.Children.Add(rectangle);

                    Grid.SetRow(rectangle, y); // Ligt het niet hier aan?
                    Grid.SetColumn(rectangle, x); // Ligt het niet hier aan?
                }
        }

        /// <summary>
        /// Creates a rectangle and gives it the given <paramref name="color"/>
        /// </summary>
        /// <param name="color">Brush that corresponds with the current tetromino</param>
        /// <param name="opacity">Opacity of the rectangle, used for ghost tetromino</param>
        /// <returns>Rectangle with the given <paramref name="color"/></returns>
        private static Rectangle CreateRectangle(Brush color, double opacity = 1) => new()
        {
            Width = 30, // Width of a 'cell' in the Grid
            Height = 30, // Height of a 'cell' in the Grid
            Stroke = Brushes.Black, // Border
            StrokeThickness = 0.75, // Border thickness
            Fill = color, // Background color
            Opacity = opacity // Opacity
        };

        /// <summary>
        /// C# function that triggers when a key is pressed.
        /// This is how the user controls the game
        /// </summary>
        /// <param name="e">pressed key</param>
        protected override void OnKeyDown(KeyEventArgs e)
        {
            if (!_renderTimer.IsEnabled) return;
            if (_engine.GameOver) return;

            // In-game actions
            switch (e.Key)
            {
                case Key.Right:
                    _sound2.Play();
                    TetrisEngine.Tetromino.setStrategy(new MoveRight());
                    TetrisEngine.Tetromino.action();
                    //_engine.MoveRight();
                    break;
                case Key.Left:
                    _sound2.Play();
                    TetrisEngine.Tetromino.setStrategy(new MoveLeft());
                    TetrisEngine.Tetromino.action();
                    //_engine.MoveLeft();
                    break;
                case Key.Up:
                    _sound2.Play();
                    TetrisEngine.Tetromino.setStrategy(new RotationUp());
                    TetrisEngine.Tetromino.action();
                    //_engine.HandleRotation("UP");
                    break;
                case Key.Down:
                    _sound2.Play();
                    TetrisEngine.Tetromino.setStrategy(new RotationDown());
                    TetrisEngine.Tetromino.action();
                    //_engine.HandleRotation("DOWN");
                    break;
                case Key.Space:
                    _sound1.Play();
                    TetrisEngine.Tetromino.setStrategy(new HardDrop());
                    TetrisEngine.Tetromino.action();
                    //_engine.HardDrop();
                    break;
                case Key.LeftShift:
                    _sound2.Play();
                    TetrisEngine.Tetromino.setStrategy(new SoftDrop());
                    TetrisEngine.Tetromino.action();
                    //_engine.SoftDrop();
                    break;
                default:
                    return;
            }
            UpdateGame();
        }
    }
}