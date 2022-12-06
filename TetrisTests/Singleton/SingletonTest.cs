
namespace TetrisTests.Singleton
{
    class SingletonTest
    {
        [Test]
        public void CheckIfSingleTonSameConnection()
        {
            TetrisClient.gameLogic.Singleton.Singleton singleton1 = TetrisClient.gameLogic.Singleton.Singleton.GetInstance();
            TetrisClient.gameLogic.Singleton.Singleton singleton2 = TetrisClient.gameLogic.Singleton.Singleton.GetInstance();
            Assert.AreEqual(singleton1.GetConnection(), singleton2.GetConnection());
        }
        [Test]
        public void CheckIfSingleTonSameInstance()
        {
            TetrisClient.gameLogic.Singleton.Singleton singleton1 = TetrisClient.gameLogic.Singleton.Singleton.GetInstance();
            TetrisClient.gameLogic.Singleton.Singleton singleton2 = TetrisClient.gameLogic.Singleton.Singleton.GetInstance();
            Assert.AreSame(singleton1, singleton2);
        }
    }
}
