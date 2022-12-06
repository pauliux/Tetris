using System.Diagnostics.CodeAnalysis;

namespace TetrisClient.gameLogic.Adapter
{
    public class Target
    {
        protected int LinesToChange;
        protected int Level;
        protected string Type;
        protected int Score;

        [ExcludeFromCodeCoverage]
        public virtual int GetInformationLinesToChange()
        {
            return 0;
        }
        [ExcludeFromCodeCoverage]
        public virtual int GetInformationCurrentScore()
        {
            return 0;
        }
    }
}
