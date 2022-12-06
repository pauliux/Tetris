
namespace TetrisClient.gameLogic.Bomb
{
    public class BombLevel2 : Bombs
    {
        private const int Level = 2;
        private const string ImageEnabled = "/Resources/bomb4.png";
        private const string ImageDisabled = "/Resources/bomb4_disabled.png";

        public BombLevel2() : base(Level, ImageEnabled, ImageDisabled)
        {
        }
    }
}
