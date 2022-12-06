
using System;
using System.Collections.Generic;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;
namespace TetrisClient.gameLogic.Command
{
    public class Receiver
    {
        private TetrominoFigure _tetromino;
        private Representation _representation;
        public void Operation(string @operator, TetrominoFigure tetromino, Representation representation, AbstractFactory abstractFactory, int remove)
        {
            var offsetsToTest = new[] { 0, 1, -1, 2, -2 };
            switch (@operator)
            {
                case "left":
                    if (MovePossible(representation, ref tetromino, offsetInBoardX: -1, offsetCollisionX: -1))
                        tetromino.OffsetX--;
                    break;
                case "right":
                    if (MovePossible(representation, ref tetromino, offsetInBoardX: 1, offsetCollisionX: 1))
                        tetromino.OffsetX++;
                    break;
                case "UP":
                    foreach (var offset in offsetsToTest)
                    {
                        if (_tetromino == null)
                        {
                            _tetromino = tetromino;
                        }
                        var testTetromino = (TetrominoFigure)abstractFactory.GetTetromino(_tetromino.OffsetX, _tetromino.OffsetY, _tetromino.Matrix);
                        if (representation.CheckTurnCollision(testTetromino, @operator, offset)) continue;
                        tetromino.OffsetX += offset;
                        tetromino.Matrix = @operator switch
                        {
                            "UP" => tetromino.Matrix.Rotate90(),
                            _ => throw new ArgumentOutOfRangeException(nameof(@operator), @operator, null)
                        };
                        break;
                    }
                    break;
                case "DOWN":
                    foreach (var offset in offsetsToTest)
                    {
                        if (_tetromino == null)
                        {
                            _tetromino = tetromino;
                        }
                        var testTetromino = (TetrominoFigure)abstractFactory.GetTetromino(_tetromino.OffsetX, _tetromino.OffsetY, _tetromino.Matrix);
                        if (representation.CheckTurnCollision(testTetromino, @operator, offset)) continue;
                        tetromino.OffsetX += offset;
                        tetromino.Matrix = @operator switch
                        {
                            "DOWN" => tetromino.Matrix.Rotate90CounterClockwise(),
                            _ => throw new ArgumentOutOfRangeException(nameof(@operator), @operator, null)
                        };
                        break;
                    }
                    break;
                case "HARDDROP":
                    while (SoftDrop(representation, ref tetromino))
                    {

                    }
                    break;
                case "ANGELBOMB":
                    ICollection<int> temp2 = new List<int>();
                    for (int i = 15; i > 15 - remove; i--)
                    {
                        temp2.Add(i);
                    }
                    representation.DeleteRow(temp2);
                    break;
            }

            _tetromino = tetromino;
            _representation = representation;
        }
        private bool SoftDrop(Representation representation, ref TetrominoFigure tetromino)
        {
            if (!MovePossible(representation, ref tetromino, offsetInBoardX: 0, offsetInBoardY: 1, offsetCollisionY: 1)) return false;
            tetromino.OffsetY++;
            return true;
        }
        private bool MovePossible(Representation representation, ref TetrominoFigure tetromino, int offsetInBoardX = 0, int offsetInBoardY = 0, int offsetCollisionX = 0,
    int offsetCollisionY = 0)
        {
            return representation.IsInRangeOfBoard(tetromino, offsetInBoardX, offsetInBoardY)
                   && !representation.CheckCollision(tetromino, offsetCollisionX, offsetCollisionY);
        }

        public TetrominoFigure GetFigure()
        {
            return _tetromino;
        }
        public Representation GetRepresentation()
        {
            return _representation;
        }
    }
}
