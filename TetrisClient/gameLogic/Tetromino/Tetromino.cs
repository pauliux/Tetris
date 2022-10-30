using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Media;
using System.Xml.Linq;
using TetrisClient.gameLogic.Decorator;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;

namespace TetrisClient.gameLogic.Tetromino
{

    /// <summary>
    /// A Tetromino is a "block" in the tetris game.
    /// </summary>
    public abstract class Tetromino : Unit
    {
        public Matrix Matrix { get; set; }
        public int OffsetX;
        public int OffsetY;

        private readonly TetrominoComponent _component;
        /// <summary>
        /// Default start position is at the left top (0,0).
        /// Constructor overloading is used if alternate spawnpoints
        /// are being chosen.
        /// </summary>
        public Tetromino(int level, int offsetX, int offsetY, Random random, TetrominoComponent component) : base(level)
        {
            this._component = component;
            Matrix = CreateShape(random);
            OffsetX = offsetX;
            OffsetY = offsetY;
        }

        /// <summary>
        /// Constructor with the option of setting the offsets.
        /// </summary>
        /// <param name="level">game level</param>
        /// <param name="offsetX">from the left side of the grid</param>
        /// <param name="offsetY">from the bottom of the grid</param>
        /// <param name="component">decorator></param>
        public Tetromino(int level, int offsetX, int offsetY, TetrominoComponent component) : base(level)
        {
            this._component = component;
            Matrix = CreateShape();
            OffsetX = offsetX;
            OffsetY = offsetY;
        }

        /// <summary>
        /// This constructor is only used to clone tetromino's
        /// </summary>
        /// <param name="level">game level</param>
        /// <param name="offsetX">from the left side of the grid</param>
        /// <param name="offsetY">from the bottom of the grid</param>
        /// <param name="matrix">matrix of a tetromino</param>
        /// <param name="component">decorator></param>
        public Tetromino(int level, int offsetX, int offsetY, Matrix matrix, TetrominoComponent component) :base(level)
        {
            this._component = component;
            Matrix = matrix;
            OffsetX = offsetX;
            OffsetY = offsetY;
        }

        /// <summary>
        /// Calculates all x and y positions from the tetromino in the board(also uses the offsets)
        /// </summary>
        /// <returns>All coordinates</returns>
        public List<(int, int)> CalculatePositions()
        {
            var coordinates = new List<(int, int)>();
            for (var y = 0; y < Matrix.Value.GetLength(0); y++)
                for (var x = 0; x < Matrix.Value.GetLength(1); x++)
                {
                    if (Matrix.Value[y, x] == 0)
                        continue; //block does not need to be rendered when it is 0 because its empty
                    coordinates.Add((y + OffsetY, x + OffsetX));
                }

            return coordinates;
        }

        /// <summary>
        /// Gives back the 3D array that corresponds with the given Tetromino shape enum.
        /// </summary>
        /// <param name="rand">random generator. If provided, it will generate same 'random' shape as enemy's</param>
        /// <returns>3D array that represents a Tetromino of the passed enum</returns>
        /// <exception cref="ArgumentOutOfRangeException">when an invalid entry is passed</exception>
        public Matrix CreateShape(Random rand = null)
        {
            Random random = rand ?? new Random();
            return _component.getTetrominos().ElementAt(random.Next(0, _component.getTetrominos().Count)).Value;
        }
    }
}