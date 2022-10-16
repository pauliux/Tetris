using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Factory
{
    public abstract class Unit
    {
        private int level;

        protected Unit(int level)
        {
            this.level = level;
        }
    }
}
