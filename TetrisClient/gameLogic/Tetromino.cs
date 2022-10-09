using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Media;

namespace TetrisClient
{

    /// <summary>
    /// A Tetromino is a "block" in the tetris game.
    /// </summary>
    public class Tetromino
    {
        public static Brush[] BrushArray =
        {
            Brushes.Black,
            Brushes.Yellow,
            Brushes.BlueViolet,
            Brushes.Aqua,
            Brushes.DarkOrange,
            Brushes.LimeGreen,
            Brushes.Red,
            Brushes.Blue
        };

        public Dictionary<char, Matrix> TetrominoShapes = new Dictionary<char, Matrix>
        {
            {'O',new Matrix(new[,] { { 1, 1 }, { 1, 1 } })},
            {'T',new Matrix(new[,] { { 2, 2, 2 }, { 0, 2, 0 }, { 0, 0, 0 } })},
            {'J',new Matrix(new[,] { { 0, 3, 0 }, { 0, 3, 0 }, { 3, 3, 0 } })},
            {'L',new Matrix(new[,] { { 0, 4, 0 }, { 0, 4, 0 }, { 0, 4, 4 } })},
            {'S',new Matrix(new[,] { { 0, 5, 5 }, { 5, 5, 0 }, { 0, 0, 0 } })},
            {'Z',new Matrix(new[,] { { 6, 6, 0 }, { 0, 6, 6 }, { 0, 0, 0 } })},
            {'I', new Matrix(new[,] { { 0, 0, 0, 0 }, { 7, 7, 7, 7 }, { 0, 0, 0, 0 }, { 0, 0, 0, 0 } })}
        };

        public Matrix Matrix { get; set; }
        public int OffsetX;
        public int OffsetY;

        /// <summary>
        /// Default start position is at the left top (0,0).
        /// Constructor overloading is used if alternate spawnpoints
        /// are being chosen.
        /// </summary>
        public Tetromino() => new Tetromino(0, 0);

        public Tetromino(int offsetX, int offsetY, Random random)
        {
            Matrix = CreateShape(random);
            OffsetX = offsetX;
            OffsetY = offsetY;
        }

        /// <summary>
        /// Constructor with the option of setting the offsets.
        /// </summary>
        /// <param name="offsetX">from the left side of the grid</param>
        /// <param name="offsetY">from the bottom of the grid</param>
        /// <param name="seed">random seed</param>
        public Tetromino(int offsetX, int offsetY)
        {
            Matrix = CreateShape();
            OffsetX = offsetX;
            OffsetY = offsetY;
        }

        /// <summary>
        /// This constructor is only used to clone tetromino's
        /// </summary>
        /// <param name="offsetX">from the left side of the grid</param>
        /// <param name="offsetY">from the bottom of the grid</param>
        /// <param name="matrix">matrix of a tetromino</param>
        /// <param name="shape">shape of a tetromino</param>
        /// <param name="seed">random seed</param>
        public Tetromino(int offsetX, int offsetY, Matrix matrix)
        {
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
        /// <param name="shape">TetrominoShape enum</param>
        /// <returns>3D array that represents a Tetromino of the passed enum</returns>
        /// <exception cref="ArgumentOutOfRangeException">when an invalid entry is passed</exception>
        public Matrix CreateShape(Random rand = null)
        {
            Random random = rand ?? new Random();
            return TetrominoShapes.ElementAt(random.Next(0, TetrominoShapes.Count)).Value;
        }
    }
}