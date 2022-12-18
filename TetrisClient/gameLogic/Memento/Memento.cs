using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Memento
{
    public class Memento
    {
        string state;
        // Constructor
        public Memento(string state)
        {
            this.state = state;
        }
        public string State
        {
            get { return state; }
        }
    }
}
