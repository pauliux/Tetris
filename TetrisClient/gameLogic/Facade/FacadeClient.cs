using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Facade
{
    [ExcludeFromCodeCoverage]
    class FacadeClient
    {
        private TetrominoFigure tetromino;
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
