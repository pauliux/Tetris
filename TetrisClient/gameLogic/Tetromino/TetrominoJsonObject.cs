using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Tetromino
{
    [ExcludeFromCodeCoverage]
    public class TetrominoJsonObject
    {
        public Matrix Matrix { get; set; }
        public int OffsetX;
        public int OffsetY;

        public TetrominoJsonObject(int offsetX, int offsetY, Matrix matrix)
        {
            OffsetX = offsetX;
            OffsetY = offsetY;
            Matrix = matrix;
        }
    }
}
