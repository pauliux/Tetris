using System.Diagnostics;
using Moq;
using System.Windows.Threading;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Command;
using TetrisClient.gameLogic.Decorator;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisTests
{
    public class TetrisEngineTest
    {
        private TetrisEngine? _engine;

        private User MockUser()
        {
            var mockUser = new Mock<User>();
            return mockUser.Object;
        }

        private Level1Factory MockLevel1Factory()
        {
            var mockLevel1Factory = new Mock<Level1Factory>();
            mockLevel1Factory.Setup(ms => ms.GetTetromino(It.IsAny<int>(), It.IsAny<int>(), It.IsAny<Random>()))
                .Returns((int x, int y, Random random) => new TetrominoLevel1(1, x, y, random, new TetrominoDecoratorLevel1(new ConcreteTetrominoComponent())));

            mockLevel1Factory.Setup(ms => ms.GetTetromino(It.IsAny<int>(), It.IsAny<int>()))
                .Returns((int x, int y) => new TetrominoLevel1(1, x, y, new TetrominoDecoratorLevel1(new ConcreteTetrominoComponent())));


            return mockLevel1Factory.Object;
        }

        private Level1 MockLevel1(Level1Factory level1Factory)
        {
            var mockLevel1 = new Mock<Level1>();
            mockLevel1.Setup(ms => ms.GetAbstractFactory())
                .Returns(level1Factory);
            return mockLevel1.Object;
        }

        private LevelCreator MockLevelCreator(Level1 level1)
        {
            var mockLevelCreator = new Mock<LevelCreator>();
            mockLevelCreator.Setup(ms => ms.GetLevel(1))
                .Returns(level1);
            return mockLevelCreator.Object;
        }


        [SetUp]
        public void Setup()
        {
            var level1Factory = MockLevel1Factory();
            var level1 = MockLevel1(level1Factory);
            var levelCreator = MockLevelCreator(level1);
            var user = MockUser();

            _engine = new TetrisEngine(user, levelCreator, new Representation(), new TetrisClient.gameLogic.Score());
        }

        [Test]
        public void StartGameWithSeed()
        {
            Debug.Assert(_engine != null, nameof(_engine) + " != null");
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
            Debug.Assert(_engine != null, nameof(_engine) + " != null");
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
            Debug.Assert(_engine != null, nameof(_engine) + " != null");
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
            Debug.Assert(_engine != null, nameof(_engine) + " != null");
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
            Assert.That(factory.GetBomb(), Is.TypeOf<BombLevel1>());
        }

    }
}
