using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Proxy
{
    public class ProxyClient
    {
        public void ClientCallScore(ISubject subject, int score)
        {
            subject.SendScore(score);
        }
    }
}
