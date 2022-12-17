using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.ChainOfResposibility
{
    public interface IHandler
    {
        IHandler SetNext(IHandler handler);
    }
}
