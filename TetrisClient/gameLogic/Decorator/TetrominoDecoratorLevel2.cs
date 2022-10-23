using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Decorator
{
    public class TetrominoDecoratorLevel2: Decorator
    {
        public override Dictionary<char, Matrix> getTetrominos()
        {
            var tetromino = base.getTetrominos();
            tetromino.Add('S', new Matrix(new[,] { { 0, 5, 5 }, { 5, 5, 0 }, { 0, 0, 0 } }));
            return tetromino;
        }

        public TetrominoDecoratorLevel2(TetrominoComponent c) : base(c)
        {
        }
    }
}
