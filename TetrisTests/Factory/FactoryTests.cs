
using System.Diagnostics;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisTests.Factory
{
    public class FactoryTests
    {
        private LevelCreator? _creator;

        [OneTimeSetUp]
        public void Setup()
        {
            _creator = new LevelCreator();
        }

        [Test]
        public void GetLevel1ReturnsLevel1()
        {
            Debug.Assert(_creator != null, nameof(_creator) + " != null");
            Level level = _creator.GetLevel(1);
            Assert.That(level, Is.TypeOf<Level1>());
        }

        [Test]
        public void GetLevel2ReturnsLevel2()
        {
            Debug.Assert(_creator != null, nameof(_creator) + " != null");
            Level level = _creator.GetLevel(2);
            Assert.That(level, Is.TypeOf<Level2>());
        }

        [Test]
        public void GetLevel3ReturnsLevel2()
        {
            Debug.Assert(_creator != null, nameof(_creator) + " != null");
            Level level = _creator.GetLevel(3);
            Assert.That(level, Is.TypeOf<Level2>());
        }

        [Test]
        public void GetAbstractFactoryReturnsLevel1Factory()
        {
            var abstractFactory = new Level1().GetAbstractFactory();
            Assert.That(abstractFactory, Is.TypeOf<Level1Factory>());
        }

        [Test]
        public void GetAbstractFactoryReturnsLevel2Factory()
        {
            var abstractFactory = new Level2().GetAbstractFactory();
            Assert.That(abstractFactory, Is.TypeOf<Level2Factory>());
        }

        [Test]
        public void GetEvilBombReturnsEvilBombLevel1()
        {
            var factory = new Level1Factory();
            Assert.That(factory.GetEvilBomb(), Is.TypeOf<EvilBombLevel1>());
        }

        [Test]
        public void GetEvilBombReturnsEvilBombLevel2()
        {
            var factory = new Level2Factory();
            Assert.That(factory.GetEvilBomb(), Is.TypeOf<EvilBombLevel2>());
        }

        [Test]
        public void GetBombReturnsBombLevel1()
        {
            var factory = new Level1Factory();
            Assert.That(factory.GetBomb(), Is.TypeOf<BombLevel1>());
        }

        [Test]
        public void GetBombReturnsBombLevel2()
        {
            var factory = new Level2Factory();
            Assert.That(factory.GetBomb(), Is.TypeOf<BombLevel2>());
        }

        [Test]
        public void GetTetrominoReturnsTetrominoLevel2()
        {
            var factory = new Level2Factory();

            Assert.Multiple(() =>
                {
                    Assert.That(factory.GetTetromino(1, 1, new Matrix()), Is.TypeOf<TetrominoLevel2>());
                    Assert.That(factory.GetTetromino(1, 1, new Random()), Is.TypeOf<TetrominoLevel2>());
                    Assert.That(factory.GetTetromino(1, 1), Is.TypeOf<TetrominoLevel2>());
                });
        }

        [Test]
        public void GetTetrominoReturnsTetrominoLevel1()
        {
            var factory = new Level1Factory();
            Assert.Multiple(() =>
            {
                Assert.That(factory.GetTetromino(1, 1, new Matrix()), Is.TypeOf<TetrominoLevel1>());
                Assert.That(factory.GetTetromino(1, 1, new Random()), Is.TypeOf<TetrominoLevel1>());
                Assert.That(factory.GetTetromino(1, 1), Is.TypeOf<TetrominoLevel1>());
            });
        }

        [Test]
        public void TestBombsGetters()
        {
            var bomb = new BombLevel1();

            Assert.Multiple(() =>
            {
                Assert.That(bomb.GetImageDisabled(), Is.EqualTo("/Resources/bomb1_disabled.png"));
                Assert.That(bomb.GetImageEnabled(), Is.EqualTo("/Resources/bomb1.png"));
                Assert.That(bomb.GetLevel(), Is.EqualTo(1));
            });
        }

    }

}
