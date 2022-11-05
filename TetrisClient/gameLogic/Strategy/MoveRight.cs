using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Strategy
{
    class MoveRight : AbstractStrategy
    {
        //Moves the tetromino to the right if allowed
        public override void moveDifferently()
        {
            if (TetrisEngine.MovePossible(offsetInBoardX: 1, offsetCollisionX: 1))
                TetrisEngine.Tetromino.OffsetX++;
        }

    }
}
