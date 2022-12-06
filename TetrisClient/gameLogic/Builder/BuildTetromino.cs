
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Builder
{
    public class BuildTetromino : Builder
    {
        public BuildTetromino(Unit rawUnit) : base(rawUnit)
        {
            _ = RawUnit;
        }
    }
}
