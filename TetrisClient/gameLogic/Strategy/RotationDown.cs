using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Strategy
{
    class RotationDown : AbstractStrategy
    {
        public override void moveDifferently()
        {
            HandleRotation("DOWN");
        }
    }
}
