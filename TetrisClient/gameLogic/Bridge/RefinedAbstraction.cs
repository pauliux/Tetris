
using System.Diagnostics.CodeAnalysis;

namespace TetrisClient.gameLogic.Bridge
{
    [ExcludeFromCodeCoverage]
    public class RefinedAbstraction : Abstraction
    {
        public override void Operation()
        {
            Implementor.Operation();
        }
    }
}
