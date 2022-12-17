using TetrisClient.gameLogic.Adapter;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Proxy;

namespace TetrisClient
{
    public abstract class Bombs : Unit,ISubject
    {
        private State state;

        private string _imageEnabled;
        private string _imageDisabled;
        private int _level;

        protected Bombs(int level, string imageEnabled, string imageDisabled) : base(level)
        {
            _imageEnabled = imageEnabled;
            _imageDisabled = imageDisabled;
            this._level = level;
            this.state = new DisabledState(0, this, new Adapter("angel", 1));
        }
        public State State
        {
            get { return state; }
            set { state = value; }
        }

        public void SendScore(int score)
        {
            state.SendScore(score);
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
