using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.EvilBomb
{
    public class EvilBombLevel1 : Bombs
    {
        private const int Level = 1;
        private const string ImageEnabled = "/Resources/bomb1_evil.png";
        private const string ImageDisabled = "/Resources/bomb1_evil_disabled.png";

        public EvilBombLevel1() : base(Level, ImageEnabled, ImageDisabled)
        {
        }
    }
}
