using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Iterator
{
    public abstract class Aggregate
    {
        public abstract Iterator CreateIterator();
    }
}
