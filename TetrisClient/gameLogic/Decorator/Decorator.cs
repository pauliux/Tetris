using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
