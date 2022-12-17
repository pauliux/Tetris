using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Adapter;

namespace TetrisClient
{
    internal class DisabledState : State
    {
        // Overloaded constructors
        public DisabledState(State state) :
            this(state.CurrentScore, state.Bomb, state.AngelBomb)
        {
        }
        public DisabledState(int currentScore, Bombs bomb, Target angelBomb)
        {
            this.currentScore = currentScore;
            this.bomb = bomb;
            this.angelBomb = angelBomb;
        }
        public override void SendScore(int score)
        {
            currentScore = score;
            StateChangeCheck();
        }
        private void StateChangeCheck()
        {
            if (currentScore >= angelBomb.GetInformationCurrentScore())
            {
                bomb.State = new EnabledState(this);
            }
        }

    }
}
