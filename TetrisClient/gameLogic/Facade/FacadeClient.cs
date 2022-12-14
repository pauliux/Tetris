
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Facade
{
    public class FacadeClient
    {
        public static string ClientEnableBomb(Facade facade)
        {
            return facade.EnableBombPic();
        }
        public static string ClientDisableBomb(Facade facade)
        {
            return facade.DisableBombPic();
        }
        public static void PutTetromino(Facade facade, TetrominoFigure tetromino)
        {
            facade.PutTetromino(tetromino);
        }
    }
}
