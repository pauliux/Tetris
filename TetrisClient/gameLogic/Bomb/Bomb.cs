﻿using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Bomb
{
    public abstract class Bombs : Unit
    {
        private string _imageEnabled;
        private string _imageDisabled;
        private int _level;

        protected Bombs(int level, string imageEnabled, string imageDisabled) : base(level)
        {
            _imageEnabled = imageEnabled;
            _imageDisabled = imageDisabled;
            this._level = level;
        }

        public string GetImageEnabled()
        {
            return _imageEnabled;
        }

        public string GetImageDisabled()
        {
            return _imageDisabled;
        }

        public int GetLevel()
        {
            return _level;
        }
    }
}
