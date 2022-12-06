
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Builder
{
    public class BuildBomb: Builder
    {
        public BuildBomb(Unit rawUnit) : base(rawUnit)
        {
            _ = RawUnit;
        }
    }
}
