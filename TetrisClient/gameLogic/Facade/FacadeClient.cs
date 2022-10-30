using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Facade
{
    class FacadeClient
    {
        public static string ClientEnableBomb(Facade facade)
        {
            return facade.EnableBombPic();
        }
        public static string ClientDisableBomb(Facade facade)
        {
            return facade.DisableBombPic();
        }
    }
}
