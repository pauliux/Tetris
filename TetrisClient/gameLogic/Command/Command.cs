using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;
namespace TetrisClient.gameLogic.Command
{
    /// <summary>
    /// The 'Command' abstract class
    /// </summary>
    public abstract class Command
    {
        public abstract void Execute();
        public abstract void UnExecute();
        public abstract TetrominoFigure GetTetrominoFigure();
        public abstract Representation GetRepresentation();
    }
}
