
using System.Diagnostics.CodeAnalysis;

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
