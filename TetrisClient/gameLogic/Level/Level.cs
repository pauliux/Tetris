
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Level
{
    public abstract class Level
    {
        public abstract AbstractFactory GetAbstractFactory();
    }
}
