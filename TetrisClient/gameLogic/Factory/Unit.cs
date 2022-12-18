using System;
using System.Diagnostics.CodeAnalysis;
using TetrisClient.gameLogic.Observers;
using TetrisClient.gameLogic.Strategy;

namespace TetrisClient.gameLogic.Factory
{
    public abstract class Unit : Observer, ICloneable
    {
        private int _level;

        private AbstractStrategy _abstractStrategy;

        protected Unit(int level)
        {
            this._level = level;
        }

        public abstract void Add(Unit c);
        public abstract void Remove(Unit c);
        public abstract void Execute(Representation representation);

        public object Clone()
        {
            return (Unit)this.MemberwiseClone();
        }
        [ExcludeFromCodeCoverage]
        public AbstractStrategy GetStrategy()
        {
            return _abstractStrategy;
        }

        public void SetStrategy(AbstractStrategy abstractStrategy)
        {
            this._abstractStrategy = abstractStrategy;
        }

        public void Action()
        {
            this._abstractStrategy.MoveDifferently();
            string actionName = "Tetromino changed position!";

            if (this.Subject != null)
            {
                this.Subject.ReceiveMessage(actionName);
            }
        }

        public override void Update(string command)
        {
            Console.WriteLine("Tetromino changed position!");
        }
    }
}
