using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Diagnostics.CodeAnalysis;

namespace TetrisClient.gameLogic.Adapter
{
    public class Target
    {
        protected int linesToChange;
        protected int level;
        protected string type;
        protected int score;

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
