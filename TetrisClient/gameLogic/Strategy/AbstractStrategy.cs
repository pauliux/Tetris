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
        public abstract void moveDifferently();

        //Checks if the current tetromino move is possible
        public bool CheckIfPossible()
        {
            if (!TetrisEngine.MovePossible(offsetInBoardX: 0, offsetInBoardY: 1, offsetCollisionY: 1)) return false;
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
                var testTetromino = (Tetromino)TetrisEngine._abstractFactory.getTetromino(TetrisEngine.Tetromino.OffsetX, TetrisEngine.Tetromino.OffsetY, TetrisEngine.Tetromino.Matrix);
                if (TetrisEngine.Representation.CheckTurnCollision(testTetromino, type, offset)) continue;
                TetrisEngine.Tetromino.OffsetX += offset;
                TetrisEngine.Tetromino.Matrix = type switch
                {
                    "UP" => TetrisEngine.Tetromino.Matrix.Rotate90(),
                    "DOWN" => TetrisEngine.Tetromino.Matrix.Rotate90CounterClockwise(),
                    _ => TetrisEngine.Tetromino.Matrix
                };
                break;
            }
        }
    }
}
