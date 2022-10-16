using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Tetromino
{
    public class TetrominoLevel1 : Tetromino
    {
        public TetrominoLevel1(int level, int offsetX, int offsetY, Random random) : base(level, offsetX, offsetY, random)
        {
        }

        public TetrominoLevel1(int level, int offsetX, int offsetY) : base(level, offsetX, offsetY)
        {
        }

        public TetrominoLevel1(int level, int offsetX, int offsetY, Matrix matrix) : base(level, offsetX, offsetY, matrix)
        {
        }

        public override Dictionary<char, Matrix> GetTetrominos()
        {
            return new Dictionary<char, Matrix>
        {
            {'O',new Matrix(new[,] { { 1, 1 }, { 1, 1 } })}
            //{'T',new Matrix(new[,] { { 2, 2, 2 }, { 0, 2, 0 }, { 0, 0, 0 } })},
            //{'J',new Matrix(new[,] { { 0, 3, 0 }, { 0, 3, 0 }, { 3, 3, 0 } })},
            //{'L',new Matrix(new[,] { { 0, 4, 0 }, { 0, 4, 0 }, { 0, 4, 4 } })},
            //{'S',new Matrix(new[,] { { 0, 5, 5 }, { 5, 5, 0 }, { 0, 0, 0 } })},
            //{'Z',new Matrix(new[,] { { 6, 6, 0 }, { 0, 6, 6 }, { 0, 0, 0 } })},
            //{'I', new Matrix(new[,] { { 0, 0, 0, 0 }, { 7, 7, 7, 7 }, { 0, 0, 0, 0 }, { 0, 0, 0, 0 } })}
        };
        }
    }
}
