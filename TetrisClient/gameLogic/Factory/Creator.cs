
namespace TetrisClient.gameLogic.Factory
{
    public abstract class Creator
    {
        public abstract Level.Level GetLevel(int level);
    }
}
