using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Proxy
{
    public class Proxy : ISubject
    {
        private Bombs bomb;

        public Proxy (Bombs bomb)
        {
            this.bomb = bomb;
        }

        public void SendScore(int score)
        {
            bomb.SendScore(score);
        }
    }
}
