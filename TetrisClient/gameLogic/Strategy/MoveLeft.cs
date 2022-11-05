using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;
using TetrisClient.gameLogic;

namespace TetrisClient
{
    class MoveLeft : AbstractStrategy
    {
        //Moves the tetromino to the left if allowed
        public override void moveDifferently()
        {

            if (TetrisEngine.MovePossible(offsetInBoardX: -1, offsetCollisionX: -1))
                TetrisEngine.Tetromino.OffsetX--;
        }

    }
}
