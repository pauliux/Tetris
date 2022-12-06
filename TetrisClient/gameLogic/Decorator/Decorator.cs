
using System.Collections.Generic;

namespace TetrisClient.gameLogic.Decorator
{
    public class Decorator : TetrominoComponent
    {
        private TetrominoComponent component;

        public Decorator(TetrominoComponent component)
        {
            this.component = component;
        }


        public override Dictionary<char, Matrix> getTetrominos()
        {
            return component.getTetrominos();
        }
    }
}
