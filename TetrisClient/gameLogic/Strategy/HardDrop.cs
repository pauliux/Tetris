using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Strategy
{
    class HardDrop : AbstractStrategy
    {
        public override void moveDifferently()
        {
            //Drops the current tetromino to as low as possible
            while (CheckIfPossible())
            {
                TetrisEngine.Tetromino.OffsetY++;
            }
        }
    }
}
