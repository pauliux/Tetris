using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Level
{
    internal class Level1 : Level
    {
        public override AbstractFactory GetAbstractFactory()
        {
            return new Level1Factory();
        }
    }
}
