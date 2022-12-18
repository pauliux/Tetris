using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Visitor
{
    public interface Visitor
    {
        void Visit(TetrominoFigure element);
    }
}
