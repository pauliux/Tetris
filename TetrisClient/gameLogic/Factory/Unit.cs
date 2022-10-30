using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Factory
{
    public abstract class Unit : ICloneable
    {
        private int level;

        protected Unit(int level)
        {
            this.level = level;
        }

        public object Clone()
        {
            return (Unit)this.MemberwiseClone();
        }
    }
}
