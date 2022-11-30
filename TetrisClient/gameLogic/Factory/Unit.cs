using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Observers;

namespace TetrisClient.gameLogic.Factory
{
    public abstract class Unit : Observer, ICloneable
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
        [ExcludeFromCodeCoverage]
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
            string actionName = "Tetromino changed position!";

            if (this.subject != null)
            {
                this.subject.receiveMessage(actionName);
            }
        }

        public override void update(string command)
        {
            Console.WriteLine("Tetromino changed position!");
        }
    }
}
