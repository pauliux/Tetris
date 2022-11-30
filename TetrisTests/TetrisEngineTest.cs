using Moq;
using System;
using System.Windows.Threading;
using TetrisClient;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Command;
using TetrisClient.gameLogic.Decorator;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Observers;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisTests
{
    public class TetrisEngineTest
    {
        private TetrisEngine _engine;

        private User mockUser()
        {
            var mockUser = new Mock<User>();
            return mockUser.Object;
        }

        private Level1Factory mockLevel1Factory()
        {
            var mockLevel1Factory = new Mock<Level1Factory>();
            mockLevel1Factory.Setup(ms => ms.getTetromino(It.IsAny<int>(), It.IsAny<int>(), It.IsAny<Random>()))
                .Returns((int x, int y, Random random) => new TetrominoLevel1(1, x, y, random, new TetrominoDecoratorLevel1(new ConcreteTetrominoComponent())));

            mockLevel1Factory.Setup(ms => ms.getTetromino(It.IsAny<int>(), It.IsAny<int>()))
                .Returns((int x, int y) => new TetrominoLevel1(1, x, y, new TetrominoDecoratorLevel1(new ConcreteTetrominoComponent())));


            return mockLevel1Factory.Object;
        }

        private Level1 mockLevel1(Level1Factory level1Factory)
        {
            var mockLevel1 = new Mock<Level1>();
            mockLevel1.Setup(ms => ms.GetAbstractFactory())
                .Returns(level1Factory);
            return mockLevel1.Object;
        }

        private LevelCreator mockLevelCreator(Level1 level1)
        {
            var mockLevelCreator = new Mock<LevelCreator>();
            mockLevelCreator.Setup(ms => ms.GetLevel(1))
                .Returns(level1);
            return mockLevelCreator.Object;
        }


        [SetUp]
        public void Setup()
        {
            var level1Factory = mockLevel1Factory();
            var level1 = mockLevel1(level1Factory);
            var levelCreator = mockLevelCreator(level1);
            var user = mockUser();

            _engine = new TetrisEngine(user, levelCreator, new Representation(), new Score());
        }

        [Test]
        public void StartGameWithSeed()
        {
            _engine.StartGame(123);

            Assert.Multiple(() =>
            {
                Assert.IsNotNull(_engine.Tetromino);
                Assert.IsNotNull(_engine.NextTetromino);
            });
        }


        [Test]
        public void StartGameWithoutSeed()
        {
            _engine.StartGame();

            Assert.Multiple(() =>
            {
                Assert.IsNotNull(_engine.Tetromino);
                Assert.IsNotNull(_engine.NextTetromino);
            });
        }

        [Test]
        [TestCase(true)]
        [TestCase(false)]
        public void TogglePause(bool enabled)
        {
            _engine.GameTimer = new DispatcherTimer
            {
                IsEnabled = enabled
            };

            _engine.TogglePause();

            Assert.That(!enabled, Is.EqualTo(_engine.GameTimer.IsEnabled));
        }


        [Test]
        public void StopGame()
        {
            _engine.GameTimer = new DispatcherTimer
            {
                IsEnabled = true
            };

            _engine.StopGame();

            Assert.IsFalse(_engine.GameTimer.IsEnabled);
        }

        [Test]
        public void GetBomb()
        {
            var factory = new Level1Factory();
            Assert.That(factory.getBomb(), Is.TypeOf<BombLevel1>());
        }

    }
}
