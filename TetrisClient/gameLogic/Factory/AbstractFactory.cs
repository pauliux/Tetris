using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic
{
    public abstract class AbstractFactory
    {
        public abstract Unit getTetromino(int offsetX, int offsetY, Random random);
        public abstract Unit getTetromino(int offsetX, int offsetY);

        public abstract Unit getTetromino(int offsetX, int offsetY, Matrix matrix);
    }
}
