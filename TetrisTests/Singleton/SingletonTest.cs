using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Singleton;

namespace TetrisTests.Singelton
{
    class SingletonTest
    {
        [Test]
        public void CheckIfSingleTonSameConnection()
        {
            Singleton singleton1 = Singleton.GetInstance();
            Singleton singleton2 = Singleton.GetInstance();
            Assert.AreEqual(singleton1.getConnection(), singleton2.getConnection());
        }
        [Test]
        public void CheckIfSingleTonSameInstance()
        {
            Singleton singleton1 = Singleton.GetInstance();
            Singleton singleton2 = Singleton.GetInstance();
            Assert.AreSame(singleton1, singleton2);
        }
    }
}
