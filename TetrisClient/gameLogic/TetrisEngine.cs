using System;
using System.Linq;
using System.Windows.Threading;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Facade;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Tetromino;
using TetrisClient.gameLogic.Command;
using TetrisClient.gameLogic.Adapter;
using System.Diagnostics.CodeAnalysis;

namespace TetrisClient
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
        private User user;

        private Level _level;
        private Creator _creator;
        public AbstractFactory _abstractFactory;

        public TetrisEngine(User user, LevelCreator creator)
        {
            this.user = user;
            this._creator = creator;
        }

        public TetrisEngine()
        {
            this.user = new User();
            this._creator = new LevelCreator();
        }

        /// <summary>
        /// Starts the game, creates all items
        /// Starts the timer
        /// </summary>
        public void StartGame(int? seed = null)
        {
            _level = _creator.GetLevel(1);
            _abstractFactory = _level.GetAbstractFactory();
            if (seed != null) _random = new Random((int)seed);
            GameOver = false;
            Representation = new Representation();
            Score = new Score();
            NextTetromino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            Timer();
            NewTetromino();
        }

        [ExcludeFromCodeCoverage]
        public Bombs GetBomb()
        {
            return (Bombs)_abstractFactory.getBomb();
        }

        [ExcludeFromCodeCoverage]
        public Bombs GetEvilBomb()
        {
            return (Bombs)_abstractFactory.getEvilBomb();
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
        private void dispatcherTimer_Tick(object sender, EventArgs e)
        {
            if (DropTetromino() && !Score.ForceLevelUpdate) return;
            if (HandleScore())
            {
                _level = _creator.GetLevel(Score.Level);
                _abstractFactory = _level.GetAbstractFactory();
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
            Facade facade = new Facade(Representation);
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
            Target angelBomb = new Adapter("angel", Score.Level);
            Bombs bomb = GetBomb();
            if (Score.Points >= angelBomb.GetInformationCurrentScore())
            {
                Score.Points = Score.Points - angelBomb.GetInformationCurrentScore();
                user.Compute("ANGELBOMB", Tetromino, Representation, _abstractFactory, angelBomb.GetInformationLinesToChange());
                Representation = user.getRepresentation(Representation);
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

            NextTetromino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
        }

        /// <summary>
        /// Creates a ghost tetromino, the ghost is copied from the current tetromino
        /// It gets dropped to as low as possible(kinda like the hard drop)
        /// </summary>
        /// <returns>The ghost tetromino</returns>
        [ExcludeFromCodeCoverage]
        public TetrominoFigure CreateGhostTetromino()
        {
            var ghostTetromino = (TetrominoFigure)_abstractFactory.getTetromino(Tetromino.OffsetX,
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
            user.Compute("right", Tetromino, Representation, _abstractFactory, 0);
            Representation = user.getRepresentation(Representation);
            Tetromino = user.getTetraminoFigure(Tetromino);
        }

        [ExcludeFromCodeCoverage]
        //Moves the tetromino to the left if allowed
        public void MoveLeft()
        {
            user.Compute("left", Tetromino, Representation, _abstractFactory, 0);
            Representation = user.getRepresentation(Representation);
            Tetromino = user.getTetraminoFigure(Tetromino);
        }

        [ExcludeFromCodeCoverage]
        public void Undo()
        {
            user.Undo(1);
            Representation = user.getRepresentation(Representation);
            Tetromino = user.getTetraminoFigure(Tetromino);
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
        /// Checks if there are any deleted rows, if so the score level will be recalculated.
        /// </summary>
        /// <returns>True if the level has changed</returns>
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

        /// <summary>
        /// Stops the timer
        /// Restarts the game
        /// Asks for an extra NewTetromino so that it will not use the one from last game
        /// </summary>
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