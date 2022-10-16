using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Level
{
    public abstract class Level
    {
        public abstract AbstractFactory GetAbstractFactory();
    }
}
