
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Builder
{
    public class Director
    {
        public Unit GetLevel(Builder builder)
        {
            return builder.RawUnit;
        }

        public Unit GetBomb(Builder builder)
        {
            return builder.RawUnit;
        }
    }
}
