using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.ChainOfResposibility
{
    public class AbstractHandler : IHandler
    {
        private IHandler nexthandler;
        public virtual  HandleScore()
        {
            
        }

        public IHandler SetNext(IHandler handler)
        {
            this.nexthandler = handler;

            return handler;
        }
    }
}
