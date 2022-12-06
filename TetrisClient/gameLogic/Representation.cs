﻿using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using TetrisClient.gameLogic.Tetromino;
using static System.Linq.Enumerable;

namespace TetrisClient.gameLogic
{
    public class Representation
    {
        public readonly int[,] Board;

        /// <summary>
        /// Constructor, when called generates an empty board.
        /// </summary>
        public Representation() => Board = GenerateEmptyBoard();

        /// <summary>
        /// multidimensional array that represents the board.
        /// The numbers (1-7) indicate from which tetromino it was.
        /// This way we can accurately keep control of the colors.
        /// </summary>
        /// <returns>board representation given in a multidimensional array</returns>
        private static int[,] GenerateEmptyBoard()
        {
            return new[,]
            {
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
                {0, 0, 0, 0, 0, 0, 0, 0, 0, 0}
            };
        }

        /// <summary>
        /// Calculates, Based on the given <paramref name="givenXOffset"/> and the <paramref name="givenYOffset"/>,
        /// if the next move is possible.
        /// </summary>
        /// <param name="tetromino">Tetromino object</param>
        /// <param name="givenXOffset">Offset from the left side of the board</param>
        /// <param name="givenYOffset">Offset from the bottom side of the board</param>
        /// <returns></returns>
        public bool IsInRangeOfBoard(TetrominoFigure tetromino, int givenXOffset = 0, int givenYOffset = 0)
        {
            // Checks if any of the tetromino's blocks is out of bounds
            for (var y = 0; y < tetromino.Matrix.Value.GetLength(0); y++) //dimension 0 = y
            for (var x = 0; x < tetromino.Matrix.Value.GetLength(1); x++) //dimension 1 = x
            {
                // Do nothing when cell in the tetromino matrix is 0 (not a block)
                if (tetromino.Matrix.Value[y, x] == 0) continue;

                var yWithOffset = y + tetromino.OffsetY + givenYOffset;
                var xWithOffset = x + tetromino.OffsetX + givenXOffset;

                if (yWithOffset > Board.GetLength(0) - 1)
                    return false; // false if current block in loop is outside the board vertically
                if (xWithOffset > Board.GetLength(1) - 1 || xWithOffset < 0) return false; //^same but horizontally
            }
            return true;
        }

        /// <summary>
        /// Checks if any blocks of the given <paramref name="tetromino"/> is the same as any of the occupied blocks
        /// in the board and looks one step ahead (vertically).
        /// </summary>
        /// <param name="tetromino">Tetromino object</param>
        /// <param name="givenXOffset">Offset from the left side of the board</param>
        /// <param name="givenYOffset">Offset from the bottom side of the board</param>
        /// <returns></returns>
        [ExcludeFromCodeCoverage]
        public bool CheckCollision(TetrominoFigure tetromino, int givenXOffset = 0, int givenYOffset = 0)
        {
            var collided = false;
            for (var y = 0; y < Board.GetLength(0); y++) //dimension 0 = y
            for (var x = 0; x < Board.GetLength(1); x++) //dimension 1 = x
            {
                if (Board[y, x] != 0) // Check if block is not empty
                    tetromino.CalculatePositions().ForEach(coordinate =>
                    {
                        var (tetrominoY, tetrominoX) = coordinate;
                        if (tetrominoY == y - givenYOffset && tetrominoX == x - givenXOffset)
                            collided = true;
                    });
            }
            return collided;
        }

        /// <summary>
        /// Recreates the current Tetromino and executes the action based on the given <paramref name="type"/>
        /// and checks if that action results in a collision.
        /// </summary>
        /// <param name="testTetromino">Tetromino object</param>
        /// <param name="type">Key pressed</param>
        /// <param name="givenXOffset">Given offset</param>
        /// <returns>true if a collision has occured with the recreated Tetromino</returns>
        public bool CheckTurnCollision(TetrominoFigure testTetromino, string type, int givenXOffset = 0)
        {
            if (type is not "UP" and not "DOWN" ) return false; 
            
            testTetromino.OffsetX += givenXOffset;
            testTetromino.Matrix = type switch
            {
                "UP" => testTetromino.Matrix.Rotate90(),
                "DOWN" => testTetromino.Matrix.Rotate90CounterClockwise(),
                _ => throw new ArgumentOutOfRangeException(nameof(type), type, null)
            };

            return !IsInRangeOfBoard(testTetromino) || CheckCollision(testTetromino);
        }

        /// <summary>
        /// Mounts the current <paramref name="tetromino"/> in the board representation.
        /// </summary>
        /// <param name="tetromino">Tetromino object</param>
        public void PutTetrominoInBoard(TetrominoFigure tetromino)
        {
            //Board = tetromino.Matrix.Value;
            // Loop trough all blocks in the tetromino
            for (var y = 0; y < tetromino.Matrix.Value.GetLength(0); y++) //dimension 0 = y
                for (var x = 0; x < tetromino.Matrix.Value.GetLength(1); x++) //dimension 1 = x
                {
                    // Do nothing when cell in the tetromino matrix is 0(not a block)
                    if (tetromino.Matrix.Value[y, x] == 0) continue;

                    // Put the value at the correct spot
                    Board[y + tetromino.OffsetY, x + tetromino.OffsetX] = tetromino.Matrix.Value[y, x];
                }
        }

        /// <summary>
        /// General method that's called after each tick.
        /// Evaluates if rows are full and handles it.
        /// </summary>
        [ExcludeFromCodeCoverage]
        public int HandleRowDeletion() => DeleteFullRows(FullRows());


        /// <summary>
        /// Checks if there are any rows that are full (x axis)
        /// </summary>
        /// <returns>Row numbers that are full</returns>
        [ExcludeFromCodeCoverage]
        private List<int> FullRows()
        {
            var fullRows = new List<int>();
            for (var yAxis = 0; yAxis < Board.GetLength(0); yAxis++)
                if (Range(0, Board.GetLength(1)).Select(x => Board[yAxis, x]).ToList().FindAll(x => x > 0).Count == 10)
                    fullRows.Add(yAxis);
            return fullRows;
        }

        /// <summary>
        /// Deletes the rows that are full.
        /// </summary>
        /// <param name="fullRows"><list type="int"></list> with the row numbers that are full></param>
        [ExcludeFromCodeCoverage]
        private int DeleteFullRows(ICollection<int> fullRows)
        {
            var rowsDeleted = 0;
            for (var y = 0; y < Board.GetLength(0); y++)
            {
                if (!fullRows.Contains(y)) continue;
                for (var x = 0; x < Board.GetLength(1); x++)
                    Board[y, x] = 0;

                DropFloatingTetrominos(y);
                rowsDeleted++;
                fullRows.Remove(y);
            }

            return rowsDeleted;
        }

        public void DeleteRow(ICollection<int> fullRows)
        {
            for (var y = 0; y < Board.GetLength(0); y++)
            {
                if (!fullRows.Contains(y)) continue;
                for (var x = 0; x < Board.GetLength(1); x++)
                    Board[y, x] = 0;

                DropFloatingTetrominos(y);
                fullRows.Remove(y);
            }
        }

        /// <summary>
        /// Looks at the rows above the deleted row and copies them at the row below.
        /// </summary>
        /// <param name="deletedRow">Index of the deleted row</param>
        private void DropFloatingTetrominos(int deletedRow)
        {
            for (var y = deletedRow; y > 0; y--) //dimension 0 = y
            for (var x = 0; x < Board.GetLength(1); x++) //dimension 1 = x
                Board[y, x] = Board[y - 1, x];
        }
    }
}