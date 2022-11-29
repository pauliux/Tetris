using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Strategy
{
    public class MoveRight : AbstractStrategy
    {
        public MoveRight(AbstractFactory _abstractFactory, TetrominoFigure _tetromino, Representation _representation)
            : base(_abstractFactory, _tetromino, _representation)
        {
        }

        //Moves the tetromino to the right if allowed
        public override void moveDifferently()
        {
            if (MovePossible(offsetInBoardX: 1, offsetCollisionX: 1))
                _tetromino.OffsetX++;
        }

    }
}
