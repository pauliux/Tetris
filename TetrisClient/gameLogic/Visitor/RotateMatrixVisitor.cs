﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Visitor
{
    internal class RotateMatrixVisitor : Visitor
    {
        public void Visit(TetrominoFigure element)
        {
            element.Matrix.Rotate90();
        }

    }
}
