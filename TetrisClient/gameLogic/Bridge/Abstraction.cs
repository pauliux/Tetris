using System.Diagnostics.CodeAnalysis;

namespace TetrisClient.gameLogic.Bridge
{
    [ExcludeFromCodeCoverage]
    public class Abstraction
    {
        protected Implementor Implementor;

        public virtual void Operation()
        {
            Implementor.Operation();
        }
    }
}
