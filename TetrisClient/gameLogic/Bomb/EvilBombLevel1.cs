namespace TetrisClient.gameLogic.Bomb
{
    public class EvilBombLevel1 : Bombs
    {
        private const int Level = 1;
        private const string ImageEnabled = "/Resources/bomb1_evil.png";
        private const string ImageDisabled = "/Resources/bomb1_evil_disabled.png";

        public EvilBombLevel1() : base(Level, ImageEnabled, ImageDisabled)
        {
        }
    }
}
