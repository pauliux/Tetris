using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Facade;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisTests
{
    public class FacadeTests
    {
        private Bombs bombs;
        private Representation representation;

        private const int Level = 1;
        private const string ImageEnabled = "/Resources/bomb1.png";
        private const string ImageDisabled = "/Resources/bomb1_disabled.png";

        [OneTimeSetUp]
        public void Setup()
        {
            bombs = new BombLevel1();
            representation = new Representation();
        }

        [Test]
        public void CheckConstructors()
        {
            Facade facadeBombs = new Facade(bombs);
            Facade facadeRepresentation = new Facade(representation);
            
            Assert.Multiple(() =>
            {
                Assert.That(bombs, Is.EqualTo(facadeBombs.GetBomb()));
                Assert.That(representation, Is.EqualTo(facadeRepresentation.GetRepresentation()));
            });
        }

        [Test]
        public void CheckEnableBomb()
        {
            Facade facade = new Facade(bombs);

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
            Facade facade = new Facade(bombs);

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
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(2);
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure tetromino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);

            Facade represent = new Facade(representation);

            represent.PutTetromino(tetromino);
            representation.PutTetrominoInBoard(tetromino);

            Assert.That(representation.Board, Is.EqualTo(represent.GetRepresentation().Board));
        }

        [Test]
        public void CheckPutTetrominoClient()
        {
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(2);
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure tetromino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);

            Facade represent = new Facade(representation);

            represent.PutTetromino(tetromino);
            representation.PutTetrominoInBoard(tetromino);

            FacadeClient.PutTetromino(represent, tetromino);

            Assert.That(representation.Board, Is.EqualTo(represent.GetRepresentation().Board));
        }
    }
}
