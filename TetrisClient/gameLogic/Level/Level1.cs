
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Level
{
    public class Level1 : Level
    {
        public override AbstractFactory GetAbstractFactory()
        {
            return new Level1Factory();
        }
    }
}
