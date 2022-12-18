using System;
using System.Diagnostics.CodeAnalysis;
using System.Threading.Tasks;
using System.Windows.Threading;
using Microsoft.AspNetCore.SignalR.Client;
using Newtonsoft.Json;
using TetrisClient.gameLogic.Adapter;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.ChainOfResposibility;
using TetrisClient.gameLogic.Command;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;
using Newtonsoft.Json;

namespace TetrisClient.gameLogic
{
    public class TetrisEngine
    {
        public Representation Representation;
        public TetrominoFigure Tetromino;
        public TetrominoFigure NextTetromino;
        public Score Score;
        public DispatcherTimer GameTimer;
        public bool GameOver;
        private Random _random;
        private User _user;

        private Level.Level _level;
        private Creator _creator;
        public AbstractFactory AbstractFactory;


        /// <summary>
        /// Checks if there are any deleted rows, if so the score level will be recalculated.
        /// </summary>
        /// <returns>True if the level has changed</returns>
        [ExcludeFromCodeCoverage]
        private bool HandleScore()
        {
            var deletedRows = Representation.HandleRowDeletion();
            if (!Score.ForceLevelUpdate)
            {
                if (deletedRows == 0) return false;
                Score.HandleScore(deletedRows);
            }

            return Score.HandleLevel();
        }

        public TetrisEngine(User user, LevelCreator creator, Representation representation, Score score)
        {
            this._user = user;
            this._creator = creator;
            this.Representation = representation;
            this.Score = score;
        }

        public TetrisEngine()
        {
            this._user = new User();
            this._creator = new LevelCreator();
            this.Representation = new Representation();
            this.Score = new Score();
        }

        /// <summary>
        /// Starts the game, creates all items
        /// Starts the timer
        /// </summary>
        public void StartGame(int? seed = null)
        {
            _level = _creator.GetLevel(1);
            AbstractFactory = _level.GetAbstractFactory();
            if (seed != null) _random = new Random((int)seed);
            GameOver = false;
           
            
            NextTetromino = _random == null ? (TetrominoFigure)AbstractFactory.GetTetromino(4, 0) : (TetrominoFigure)AbstractFactory.GetTetromino(4, 0, _random);
            Timer();
            NewTetromino();
        }

        [ExcludeFromCodeCoverage]
        public Bombs GetBomb()
        {
            return (Bombs)AbstractFactory.GetBomb();
        }

        [ExcludeFromCodeCoverage]
        public Bombs GetEvilBomb()
        {
            return (Bombs)AbstractFactory.GetEvilBomb();
        }

        public void StopGame()
        {
            GameTimer.IsEnabled = false;
        }

        /// <summary>
        /// Start a DispatcherTimer because those don't interrupt the program
        /// This timer is used for determining the drop speed of tetrominos.
        /// </summary>
        private void Timer()
        {
            GameTimer = new DispatcherTimer();
            GameTimer.Tick += dispatcherTimer_Tick;
            GameTimer.Interval = new TimeSpan(0, 0, 0, 0, 900);
            GameTimer.Start();
        }

        /// <summary>
        /// Every tick of the timer it will drop the tetromino and handle the score
        /// If a level is upped the speed increased
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        [ExcludeFromCodeCoverage]
        private void dispatcherTimer_Tick(object sender, EventArgs e)
        {
            if (DropTetromino() && !Score.ForceLevelUpdate) return;
            if (HandleScore())
            {
                _level = _creator.GetLevel(Score.Level);
                AbstractFactory = _level.GetAbstractFactory();
                GameTimer.Interval = new TimeSpan(0, 0, 0, 0, Convert.ToInt32(GameTimer.Interval.Milliseconds * 0.5));
            }

            NewTetromino();
        }

        /// <summary>
        /// Drops the tetromino every <c>GameTimer.Interval</c> milliseconds
        /// Checks if the move is possible
        /// if that is not true the tetromino will be mounted in the representation
        /// </summary>
        /// <returns>true if drop was possible else false</returns>
        [ExcludeFromCodeCoverage]
        private bool DropTetromino()
        {
            Facade.Facade facade = new Facade.Facade(Representation);
            if (MovePossible(offsetInBoardY: 1, offsetCollisionY: 1))
            {
                Tetromino.OffsetY++;
                return true;
            }
            facade.PutTetromino(Tetromino);
            //Representation.PutTetrominoInBoard(Tetromino);
            return false;
        }

        [ExcludeFromCodeCoverage]
        public void AngelBomb()
        {
            Target angelBomb = new Adapter.Adapter("angel", Score.Level);
            if (Score.Points >= angelBomb.GetInformationCurrentScore())
            {
                Score.Points = Score.Points - angelBomb.GetInformationCurrentScore();
                _user.Compute("ANGELBOMB", Tetromino, Representation, AbstractFactory, angelBomb.GetInformationLinesToChange());
                Representation = _user.GetRepresentation(Representation);
            }
        }

        /// <summary>
        /// Sets the next tetromino as the current tetromino and than creates a new next tetromino and does
        /// the same with the matrices.
        /// Also sets the start position of the current tetromino. 
        /// </summary>
        /// <returns>True if the game is lost(new tetromino cant be put in an empty spot at the top, else false</returns>
        [ExcludeFromCodeCoverage]
        private void NewTetromino()
        {
            Tetromino = NextTetromino;
            if (Representation.CheckCollision(Tetromino))
            {
                StopGame();
                GameOver = true;
            }

            NextTetromino = _random == null ? (TetrominoFigure)AbstractFactory.GetTetromino(4, 0) : (TetrominoFigure)AbstractFactory.GetTetromino(4, 0, _random);
        }

        /// <summary>
        /// Creates a ghost tetromino, the ghost is copied from the current tetromino
        /// It gets dropped to as low as possible(kinda like the hard drop)
        /// </summary>
        /// <returns>The ghost tetromino</returns>
        [ExcludeFromCodeCoverage]
        public TetrominoFigure CreateGhostTetromino()
        {
            var ghostTetromino = (TetrominoFigure)AbstractFactory.GetTetromino(Tetromino.OffsetX,
              Tetromino.OffsetY,
              Tetromino.Matrix);
            while (Representation.IsInRangeOfBoard(ghostTetromino, 0, 1) &&
              !Representation.CheckCollision(ghostTetromino, givenYOffset: 1))
                ghostTetromino.OffsetY++;

            return ghostTetromino;
        }

        [ExcludeFromCodeCoverage]
        //Moves the tetromino to the right if allowed
        public void MoveRight()
        {
            _user.Compute("right", Tetromino, Representation, AbstractFactory, 0);
            Representation = _user.GetRepresentation(Representation);
            Tetromino = _user.GetTetraminoFigure(Tetromino);
        }

        [ExcludeFromCodeCoverage]
        //Moves the tetromino to the left if allowed
        public void MoveLeft()
        {
            _user.Compute("left", Tetromino, Representation, AbstractFactory, 0);
            Representation = _user.GetRepresentation(Representation);
            Tetromino = _user.GetTetraminoFigure(Tetromino);
        }

        [ExcludeFromCodeCoverage]
        public void Undo()
        {
            _user.Undo(1);
            Representation = _user.GetRepresentation(Representation);
            Tetromino = _user.GetTetraminoFigure(Tetromino);
        }
        public void DevilBomb()
        {
            Target devilBomb = new Adapter.Adapter("devil", Score.Level);
            Singleton.Singleton singleton = Singleton.Singleton.GetInstance();
            if (Score.Points >= devilBomb.GetInformationCurrentScore())
            {
                Score.Points = Score.Points - devilBomb.GetInformationCurrentScore();
                int lines = devilBomb.GetInformationLinesToChange();
                Task.Run(async () =>
                    await singleton.GetConnection().InvokeAsync("AddLines", JsonConvert.SerializeObject(lines.ToString())));
            }
        }
        /// <summary>
        /// Checks if the move is possible, the move can be simulated by giving offsets
        /// </summary>
        /// <param name="offsetInBoardX">Checks for the game borders</param>
        /// <param name="offsetInBoardY">^</param>
        /// <param name="offsetCollisionX">Checks for a collision</param>
        /// <param name="offsetCollisionY">^</param>
        /// <returns></returns>
        [ExcludeFromCodeCoverage]
        public bool MovePossible(int offsetInBoardX = 0, int offsetInBoardY = 0, int offsetCollisionX = 0,
          int offsetCollisionY = 0)
        {
            return Representation.IsInRangeOfBoard(Tetromino, offsetInBoardX, offsetInBoardY) &&
              !Representation.CheckCollision(Tetromino, offsetCollisionX, offsetCollisionY);
        }


        /// <summary>
        /// Stops the timer
        /// Restarts the game
        /// Asks for an extra NewTetromino so that it will not use the one from last game
        /// </summary>
        [ExcludeFromCodeCoverage]
        public void Restart()
        {
            GameTimer.Stop();
            StartGame();
            NewTetromino();
        }

        /// <summary>
        /// toggle the timer pause
        /// </summary>
        public void TogglePause() => GameTimer.IsEnabled = !GameTimer.IsEnabled;
    }
}