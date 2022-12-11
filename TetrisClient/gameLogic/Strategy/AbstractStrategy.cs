using System.Windows.Automation.Peers;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Iterator;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Strategy
{
    public abstract class AbstractStrategy
    {
        protected AbstractFactory AbstractFactory;
        protected TetrominoFigure Tetromino;
        protected Representation Representation;

        public AbstractStrategy(AbstractFactory abstractFactory, TetrominoFigure tetromino, Representation representation)
        {
            this.AbstractFactory = abstractFactory;
            this.Tetromino = tetromino;
            this.Representation = representation;
        }

        public abstract void MoveDifferently();

        public bool MovePossible(int offsetInBoardX = 0, int offsetInBoardY = 0, int offsetCollisionX = 0,
         int offsetCollisionY = 0)
        {
            return Representation.IsInRangeOfBoard(Tetromino, offsetInBoardX, offsetInBoardY) &&
              !Representation.CheckCollision(Tetromino, offsetCollisionX, offsetCollisionY);
        }


        public bool CheckIfPossible()
        {
            if (!MovePossible(offsetInBoardX: 0, offsetInBoardY: 1, offsetCollisionY: 1)) return false;
            return true;
        }

        /// <summary>
        /// Tries to rotate a tetromino with given offsets, if one of them succeeds
        /// the tetromino will turn.
        /// </summary>
        /// <param name="type"> UP(clockwise) or DOWN(CounterClockWise)</param>
        public void HandleRotation(string type)
        {
            if (type is not "UP" and not "DOWN") return;

            var offsetsToTest = new[] { 0, 1, -1, 2, -2 };
            ConcreteAggregate offsets = new ConcreteAggregate();
            offsets.RoatationSet();
            Iterator.Iterator i = offsets.CreateIterator();

            object offset = i.First();

            while (offset != null)
            {

                var testTetromino = (TetrominoFigure)AbstractFactory.GetTetromino(Tetromino.OffsetX, Tetromino.OffsetY, Tetromino.Matrix);
                if (Representation.CheckTurnCollision(testTetromino, type, (int)offset)) continue;
                    Tetromino.OffsetX += (int)offset;
                    Tetromino.Matrix = type switch
                    {
                        "UP" => Tetromino.Matrix.Rotate90(),
                        "DOWN" => Tetromino.Matrix.Rotate90CounterClockwise(),
                        _ => Tetromino.Matrix

                    };
                offset = i.Next();
                break;
            }

        }
    }
}
