using TetrisClient.gameLogic.Adapter;

namespace TetrisClient
{
    public abstract class State
    {
        protected int currentScore;

        protected Bombs bomb;
        protected Target angelBomb;
        // Properties
        public int CurrentScore
        {
            get { return currentScore; }
            set { currentScore = value; }
        }
        public Bombs Bomb
        {
            get { return bomb; }
            set { bomb = value; }
        }
        public Target AngelBomb
        {
            get { return angelBomb; }
            set { angelBomb = value; }
        }
        public abstract void SendScore(int score);
    }
}
