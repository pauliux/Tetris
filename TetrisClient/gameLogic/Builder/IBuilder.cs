
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Builder
{
    public abstract class IBuilder
    {
        public Unit rawUnit;

        public IBuilder(Unit rawUnit)
        {
            this.rawUnit = rawUnit;
        }

    }
}
