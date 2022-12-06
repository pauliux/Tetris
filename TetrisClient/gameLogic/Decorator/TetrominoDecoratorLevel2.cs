
using System.Collections.Generic;

namespace TetrisClient.gameLogic.Decorator
{
    public class TetrominoDecoratorLevel2: Decorator
    {
        public override Dictionary<char, Matrix> GetTetrominos()
        {
            var tetromino = base.GetTetrominos();
            tetromino.Add('S', new Matrix(new[,] { { 0, 5, 5 }, { 5, 5, 0 }, { 0, 0, 0 } }));
            return tetromino;
        }

        public TetrominoDecoratorLevel2(TetrominoComponent c) : base(c)
        {
        }
    }
}
