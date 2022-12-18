using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Mediator
{
    public class Lines : TetrisRepresentationAndLines
    {
        public int LinesToAffect { get; set; }
        public bool RemoveLine { get; set; }

        public bool AddLines { get; set; }

        public Lines(int linesToAffect, Mediator mediator) : base(mediator)
        {
            LinesToAffect = linesToAffect;
            RemoveLine = false;
            AddLines = false;
        }

        public void Send()
        {
            string message = LinesToAffect.ToString() + ":" + RemoveLine.ToString() + ":" + AddLines.ToString();
            mediator.Send(message, this);
        }
        public void Notify(string message)
        {
            string[] words = message.Split(':');
            RemoveLine = bool.Parse(words[1]);
            AddLines = bool.Parse(words[2]);
        }

    }
}
