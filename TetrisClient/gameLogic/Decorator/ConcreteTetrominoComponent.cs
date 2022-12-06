
using System.Collections.Generic;

namespace TetrisClient.gameLogic.Decorator
{
    public class ConcreteTetrominoComponent: TetrominoComponent
    {
        public override Dictionary<char, Matrix> GetTetrominos()
        {
            return new Dictionary<char, Matrix>{{ 'O', new Matrix(new[,] { { 1, 1 }, { 1, 1 } }) }};
        }
    }
}
