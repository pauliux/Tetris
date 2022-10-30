using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Bomb
{
    public abstract class Bombs : Unit
    {
        private string _imageEnabled;
        private string _imageDisabled;

        protected Bombs(int level, string imageEnabled, string imageDisabled) : base(level)
        {
            _imageEnabled = imageEnabled;
            _imageDisabled = imageDisabled;
        }

        public string GetImageEnabled()
        {
            return _imageEnabled;
        }

        public string GetImageDisabled()
        {
            return _imageDisabled;
        }
    }
}
