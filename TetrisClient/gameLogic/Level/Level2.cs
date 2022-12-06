
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Level
{
    public class Level2: Level
    {
        public override AbstractFactory GetAbstractFactory()
        {
            return new Level2Factory();
        }
    }
}
