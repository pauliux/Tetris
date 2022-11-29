using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;
using TetrisClient.gameLogic;

namespace TetrisClient
{
    public abstract class AbstractStrategy
    {
        protected AbstractFactory _abstractFactory;
        protected TetrominoFigure _tetromino;
        protected Representation _representation;

        public AbstractStrategy(AbstractFactory abstractFactory, TetrominoFigure tetromino, Representation representation)
        {
            this._abstractFactory = abstractFactory;
            this._tetromino = tetromino;
            this._representation = representation;
        }

        public abstract void moveDifferently();

        public bool MovePossible(int offsetInBoardX = 0, int offsetInBoardY = 0, int offsetCollisionX = 0,
         int offsetCollisionY = 0)
        {
            return _representation.IsInRangeOfBoard(_tetromino, offsetInBoardX, offsetInBoardY) &&
              !_representation.CheckCollision(_tetromino, offsetCollisionX, offsetCollisionY);
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
            foreach (var offset in offsetsToTest)
            {
                var testTetromino = (TetrominoFigure)_abstractFactory.getTetromino(_tetromino.OffsetX, _tetromino.OffsetY, _tetromino.Matrix);
                if (_representation.CheckTurnCollision(testTetromino, type, offset)) continue;
                _tetromino.OffsetX += offset;
                _tetromino.Matrix = type switch
                {
                    "UP" => _tetromino.Matrix.Rotate90(),
                    "DOWN" => _tetromino.Matrix.Rotate90CounterClockwise(),
                    _ => _tetromino.Matrix
                };
                break;
            }
        }
    }
}
