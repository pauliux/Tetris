﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;
using TetrisClient.gameLogic;

namespace TetrisClient.gameLogic.Command
{
    public class Receiver
    {
        private TetrominoFigure Tetromino;
        private Representation Representation;
        public void Operation(string @operator, TetrominoFigure tetromino, Representation representation, AbstractFactory abstractFactory)
        {
            var offsetsToTest = new[] { 0, 1, -1, 2, -2 };
            switch (@operator)
            {
                case "left":
                    if (MovePossible(representation,ref tetromino, offsetInBoardX: -1, offsetCollisionX: -1))
                        tetromino.OffsetX--;
                    break;
                case "right":
                    if (MovePossible(representation,ref tetromino, offsetInBoardX: 1, offsetCollisionX: 1))
                        tetromino.OffsetX++;
                    break;
                case "UP":
                    foreach (var offset in offsetsToTest)
                    {
                        var testTetromino = (TetrominoFigure)abstractFactory.getTetromino(Tetromino.OffsetX, Tetromino.OffsetY, Tetromino.Matrix);
                        if (representation.CheckTurnCollision(testTetromino, @operator, offset)) continue;
                        tetromino.OffsetX += offset;
                        tetromino.Matrix = @operator switch
                        {
                            "UP" => tetromino.Matrix.Rotate90(),
                            _ => tetromino.Matrix
                        };
                        break;
                    }
                    break;
                case "DOWN":
                    foreach (var offset in offsetsToTest)
                    {
                        var testTetromino = (TetrominoFigure)abstractFactory.getTetromino(Tetromino.OffsetX, Tetromino.OffsetY, Tetromino.Matrix);
                        if (representation.CheckTurnCollision(testTetromino, @operator, offset)) continue;
                        tetromino.OffsetX += offset;
                        tetromino.Matrix = @operator switch
                        {
                            "DOWN" => tetromino.Matrix.Rotate90CounterClockwise(),
                            _ => tetromino.Matrix
                        };
                        break;
                    }
                    break;
                case "HARDDROP":
                    while (SoftDrop(representation,ref tetromino))
                    {

                    }
                    break;
                case "ANGELBOMB2":
                    ICollection<int> temp2 = new List<int>();
                    temp2.Add(15);
                    temp2.Add(14);
                    representation.DeleteRow(temp2);
                    break;
                case "ANGELBOMB4":
                    ICollection<int> temp4 = new List<int>();
                    temp4.Add(15);
                    temp4.Add(14);
                    temp4.Add(13);
                    temp4.Add(12);
                    representation.DeleteRow(temp4);
                    break;
            }

            Tetromino = tetromino;
            Representation = representation;
        }
        private bool SoftDrop(Representation representation, ref TetrominoFigure tetromino)
        {
            if (!MovePossible(representation,ref tetromino,offsetInBoardX: 0, offsetInBoardY: 1, offsetCollisionY: 1)) return false;
            tetromino.OffsetY++;
            return true;
        }
        private bool MovePossible(Representation representation, ref TetrominoFigure tetromino, int offsetInBoardX = 0, int offsetInBoardY = 0, int offsetCollisionX = 0,
    int offsetCollisionY = 0)
        {
            return representation.IsInRangeOfBoard(tetromino, offsetInBoardX, offsetInBoardY)
                   && !representation.CheckCollision(tetromino, offsetCollisionX, offsetCollisionY);
        }

        public TetrominoFigure getFigure()
        {
            return Tetromino;
        }
        public Representation getRepresentation()
        {
            return Representation;
        }
    }
}
