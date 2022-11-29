using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Strategy
{
    public class SoftDrop : AbstractStrategy
    {
        public SoftDrop(AbstractFactory _abstractFactory, TetrominoFigure _tetromino, Representation _representation)
            : base(_abstractFactory, _tetromino, _representation)
        {
        }

        public override void moveDifferently()
        {
            if (CheckIfPossible())
            {
                _tetromino.OffsetY++;
            }
        }

    }
}
