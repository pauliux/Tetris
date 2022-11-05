using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Facade
{
    class FacadeClient
    {
        private Tetromino.Tetromino tetromino;
        public static string ClientEnableBomb(Facade facade)
        {
            return facade.EnableBombPic();
        }
        public static string ClientDisableBomb(Facade facade)
        {
            return facade.DisableBombPic();
        }
        public static void PutTetromino(Facade facade, Tetromino.Tetromino tetromino)
        {
            facade.PutTetromino(tetromino);
        }
    }
}
