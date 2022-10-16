using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Factory
{
    public abstract class Creator
    {
        public abstract Level.Level GetLevel(int level);
    }
}
