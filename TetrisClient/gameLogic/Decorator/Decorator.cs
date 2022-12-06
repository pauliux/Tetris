
using System.Collections.Generic;

namespace TetrisClient.gameLogic.Decorator
{
    public class Decorator : TetrominoComponent
    {
        private TetrominoComponent _component;

        public Decorator(TetrominoComponent component)
        {
            this._component = component;
        }


        public override Dictionary<char, Matrix> GetTetrominos()
        {
            return _component.GetTetrominos();
        }
    }
}
