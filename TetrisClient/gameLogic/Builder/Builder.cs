
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Builder
{
    public abstract class Builder
    {
        public Unit RawUnit;

        public Builder(Unit rawUnit)
        {
            this.RawUnit = rawUnit;
        }

    }
}
