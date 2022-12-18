using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Mediator
{
    public abstract class TetrisRepresentationAndLines
    {
        protected Mediator mediator;
        // Constructor
        public TetrisRepresentationAndLines(Mediator mediator)
        {
            this.mediator = mediator;
        }
    }
}
