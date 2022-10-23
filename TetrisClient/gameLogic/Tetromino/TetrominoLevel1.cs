using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrominoComponent = TetrisClient.gameLogic.Decorator.TetrominoComponent;

namespace TetrisClient.gameLogic.Tetromino
{
    public class TetrominoLevel1 : Tetromino
    {
        public TetrominoLevel1(int level, int offsetX, int offsetY, Random random, TetrominoComponent component) : base(level, offsetX, offsetY, random, component)
        {
        }

        public TetrominoLevel1(int level, int offsetX, int offsetY, TetrominoComponent component) : base(level, offsetX, offsetY, component)
        {
        }

        public TetrominoLevel1(int level, int offsetX, int offsetY, Matrix matrix, TetrominoComponent component) : base(level, offsetX, offsetY, matrix, component)
        {
        }
    }
}
