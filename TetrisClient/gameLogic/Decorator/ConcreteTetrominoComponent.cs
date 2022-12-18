
using System.Collections.Generic;

namespace TetrisClient.gameLogic.Decorator
{
    public class ConcreteTetrominoComponent: TetrominoComponent
    {
        public override Dictionary<char, Matrix> GetTetrominos()
        {
            return new Dictionary<char, Matrix>{{ 'U', new Matrix(new[,] { { 1, 0, 1 }, {1, 0, 1 }, { 1, 1, 1 } }) }};
        }
    }
}
