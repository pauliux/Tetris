using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Adapter
{
    public class Adapter : Target
    {
        private Adaptee adaptee;
        private string typee;
        public Adapter(string type, int level)
        {
            typee = type;
            this.level = level;
        }
        public override int GetInformationLinesToChange()
        {
            adaptee = new Adaptee();

            linesToChange = adaptee.GetBombsEffect(typee, level);
            return linesToChange;
        }
        public override int GetInformationCurrentScore()
        {
            adaptee = new Adaptee();
            linesToChange = adaptee.GetBombsEffect(typee, level);
            score = adaptee.GetBombsScore(typee, linesToChange, level);
            return score;
        }
    }
}
