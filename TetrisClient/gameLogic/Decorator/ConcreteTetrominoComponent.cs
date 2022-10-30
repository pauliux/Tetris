using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Decorator
{
    public class ConcreteTetrominoComponent: TetrominoComponent
    {
        public override Dictionary<char, Matrix> getTetrominos()
        {
            return new Dictionary<char, Matrix>{{ 'O', new Matrix(new[,] { { 1, 1 }, { 1, 1 } }) }};
        }
    }
}
