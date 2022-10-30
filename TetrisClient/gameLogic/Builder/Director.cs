using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Builder
{
    public class Director
    {
        public Unit getLevel(IBuilder builder)
        {
            return builder.rawUnit;
        }

        public Unit getBomb(IBuilder builder)
        {
            return builder.rawUnit;
        }
    }
}
