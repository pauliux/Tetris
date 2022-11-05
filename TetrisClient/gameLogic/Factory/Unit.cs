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

        private AbstractStrategy abstractStrategy;

        protected Unit(int level)
        {
            this.level = level;
        }

        public object Clone()
        {
            return (Unit)this.MemberwiseClone();
        }

        public AbstractStrategy getStrategy()
        {
            return abstractStrategy;
        }

        public void setStrategy(AbstractStrategy abstractStrategy)
        {
            this.abstractStrategy = abstractStrategy;
        }

        public void action()
        {
            this.abstractStrategy.moveDifferently();
        }

    }
}
