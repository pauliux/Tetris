using TetrisClient.gameLogic.Bomb;

namespace TetrisClient.gameLogic.Facade
{
    public class Facade
    {
        protected Bombs bombs;
        public Facade(Bombs bombs)
        {
            this.bombs = bombs;
        }

        public string EnableBombPic()
        {
            return bombs.GetImageEnabled();
        }

        public string DisableBombPic()
        {
            return bombs.GetImageDisabled();
        }
    }
}
