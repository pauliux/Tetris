using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Adapter;
using TetrisClient.gameLogic.Facade;

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
