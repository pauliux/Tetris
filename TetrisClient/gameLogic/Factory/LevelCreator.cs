
using TetrisClient.gameLogic.Level;

namespace TetrisClient.gameLogic.Factory
{
    public class LevelCreator : Creator
    {
        public override Level.Level GetLevel(int level)
        {
            return level switch
            {
                1 => new Level1(),
                _ => new Level2()
            };
        }
    }
}
