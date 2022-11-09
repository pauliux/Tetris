using TetrisClient;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Level;

namespace TetrisTests.Factory
{
    public class FactoryTests
    {
        private LevelCreator _creator;

        [SetUp]
        public void Setup()
        {
            _creator = new LevelCreator();
        }

        [Test]
        public void GetLevel1ReturnsLevel1()
        {
            Level level = _creator.GetLevel(1);
            Assert.That(level, Is.TypeOf<Level1>());
        }

        [Test]
        public void GetLevel2ReturnsLevel2()
        {
            Level level = _creator.GetLevel(2);
            Assert.That(level, Is.TypeOf<Level2>());
        }

        [Test]
        public void GetLevel3ReturnsLevel2()
        {
            Level level = _creator.GetLevel(3);
            Assert.That(level, Is.TypeOf<Level2>());
        }

        [Test]
        public void GetAbstractFactoryReturnsLevel1Factory()
        {
            var _abstractFactory = new Level1().GetAbstractFactory();
            Assert.That(_abstractFactory, Is.TypeOf<Level1Factory>());
        }

        [Test]
        public void GetAbstractFactoryReturnsLevel2Factory()
        {
            var _abstractFactory = new Level2().GetAbstractFactory();
            Assert.That(_abstractFactory, Is.TypeOf<Level2Factory>());
        }

    }
}
