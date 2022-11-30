using System;
using System.Collections.Generic;
using System.Diagnostics.CodeAnalysis;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Media;

namespace TetrisClient.gameLogic.Tetromino
{
    [ExcludeFromCodeCoverage]
    public static class TetrominoBrushes
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
    }
}
