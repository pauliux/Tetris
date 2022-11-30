using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics.CodeAnalysis;

namespace TetrisClient.gameLogic.Bridge
{
    [ExcludeFromCodeCoverage]
    public abstract class Implementor
    {
        public abstract void Operation();
    }
}
