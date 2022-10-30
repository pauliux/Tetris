using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Decorator
{
    public class TetrominoDecoratorLevel1 : Decorator
    {
        public override Dictionary<char, Matrix> getTetrominos()
        {
            var tetromino = base.getTetrominos();
            tetromino.Add('I', new Matrix(new[,] { { 0, 0, 0, 0 }, { 7, 7, 7, 7 }, { 0, 0, 0, 0 }, { 0, 0, 0, 0 } }));
            return tetromino;
        }

        public TetrominoDecoratorLevel1(TetrominoComponent c) : base(c)
        {
        }
    }
}
