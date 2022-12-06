using System.Diagnostics;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Facade;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisTests.Facade
{
    public class FacadeTests
    {
        private Bombs? _bombs;
        private Representation? _representation;

        private const string ImageEnabled = "/Resources/bomb1.png";
        private const string ImageDisabled = "/Resources/bomb1_disabled.png";

        [OneTimeSetUp]
        public void Setup()
        {
            _bombs = new BombLevel1();
            _representation = new Representation();
        }

        [Test]
        public void CheckConstructors()
        {
            TetrisClient.gameLogic.Facade.Facade facadeBombs = new TetrisClient.gameLogic.Facade.Facade(_bombs);
            TetrisClient.gameLogic.Facade.Facade facadeRepresentation = new TetrisClient.gameLogic.Facade.Facade(_representation);
            
            Assert.Multiple(() =>
            {
                Assert.That(_bombs, Is.EqualTo(facadeBombs.GetBomb()));
                Assert.That(_representation, Is.EqualTo(facadeRepresentation.GetRepresentation()));
            });
        }

        [Test]
        public void CheckEnableBomb()
        {
            TetrisClient.gameLogic.Facade.Facade facade = new TetrisClient.gameLogic.Facade.Facade(_bombs);

            string enableClient = FacadeClient.ClientEnableBomb(facade);
            //string enable = facade.EnableBombPic();
            
            Assert.Multiple(() =>
            {
                Assert.That(ImageEnabled, Is.EqualTo(enableClient));
                Assert.That(ImageDisabled, Is.Not.EqualTo(enableClient));

                //Assert.That(ImageEnabled, Is.EqualTo(enable));
                //Assert.That(ImageDisabled, Is.Not.EqualTo(enable));
            });
        }

        [Test]
        public void CheckDisableBomb()
        {
            TetrisClient.gameLogic.Facade.Facade facade = new TetrisClient.gameLogic.Facade.Facade(_bombs);

            //string disable = facade.DisableBombPic();
            string disableClient = FacadeClient.ClientDisableBomb(facade);

            Assert.Multiple(() =>
            {
                Assert.That(ImageDisabled, Is.EqualTo(disableClient));
                Assert.That(ImageEnabled, Is.Not.EqualTo(disableClient));

                //Assert.That(ImageDisabled, Is.EqualTo(disable));
               // Assert.That(ImageEnabled, Is.Not.EqualTo(disable));
            });
        }

        [Test]
        public void CheckPutTetromino()
        {
            Random random = new Random(20);
            Creator creator = new LevelCreator();
            Level level = creator.GetLevel(2);
            AbstractFactory abstractFactory = level.GetAbstractFactory();
            TetrominoFigure tetromino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);

            TetrisClient.gameLogic.Facade.Facade represent = new TetrisClient.gameLogic.Facade.Facade(_representation);

            represent.PutTetromino(tetromino);
            Debug.Assert(_representation != null, nameof(_representation) + " != null");
            _representation.PutTetrominoInBoard(tetromino);

            Assert.That(_representation.Board, Is.EqualTo(represent.GetRepresentation().Board));
        }

        [Test]
        public void CheckPutTetrominoClient()
        {
            Random random = new Random(20);
            Creator creator = new LevelCreator();
            Level level = creator.GetLevel(2);
            AbstractFactory abstractFactory = level.GetAbstractFactory();
            TetrominoFigure tetromino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);

            TetrisClient.gameLogic.Facade.Facade represent = new TetrisClient.gameLogic.Facade.Facade(_representation);

            represent.PutTetromino(tetromino);
            Debug.Assert(_representation != null, nameof(_representation) + " != null");
            _representation.PutTetrominoInBoard(tetromino);

            FacadeClient.PutTetromino(represent, tetromino);

            Assert.That(_representation.Board, Is.EqualTo(represent.GetRepresentation().Board));
        }
    }
}
