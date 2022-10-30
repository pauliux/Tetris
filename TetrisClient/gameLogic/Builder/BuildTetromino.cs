using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Builder
{
    public class BuildTetromino : IBuilder
    {
        public BuildTetromino(Unit rawUnit) : base(rawUnit)
        {
            _ = base.rawUnit;
        }
    }
}
