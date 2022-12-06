
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Builder
{
    public class BuildBomb: IBuilder
    {
        public BuildBomb(Unit rawUnit) : base(rawUnit)
        {
            _ = base.rawUnit;
        }
    }
}
