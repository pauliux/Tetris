using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Mediator
{
    public abstract class Mediator
    {
        public abstract void Send(string message, TetrisRepresentationAndLines connection);
    }

}
