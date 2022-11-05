using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Bomb
{
    public class EvilBombLevel2 : Bombs
    {
        private const int Level = 2;
        private const string ImageEnabled = "/Resources/bomb4_evil.png";
        private const string ImageDisabled = "/Resources/bomb4_evil_disabled.png";

        public EvilBombLevel2() : base(Level, ImageEnabled, ImageDisabled)
        {
        }
    }
}
