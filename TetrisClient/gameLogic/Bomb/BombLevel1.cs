using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Bomb
{
    public class BombLevel1 : Bomb
    {
        private const int Level = 1;
        private const string ImageEnabled = "/Resources/bomb1.png";
        private const string ImageDisabled = "/Resources/bomb1_disabled.png";

        public BombLevel1() : base(Level, ImageEnabled, ImageDisabled)
        {
        }
    }
}
