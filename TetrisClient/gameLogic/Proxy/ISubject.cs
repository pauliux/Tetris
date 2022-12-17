using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Proxy
{
    public interface ISubject
    {
        void SendScore(int score);
    }
}
