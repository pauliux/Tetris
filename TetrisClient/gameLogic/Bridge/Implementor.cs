
using System.Diagnostics.CodeAnalysis;

namespace TetrisClient.gameLogic.Bridge
{
    [ExcludeFromCodeCoverage]
    public abstract class Implementor
    {
        public abstract void Operation();
    }
}
