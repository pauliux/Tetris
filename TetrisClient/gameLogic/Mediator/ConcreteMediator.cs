using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Mediator
{
    public class ConcreteMediator : Mediator
    {
            Lines lines;
            Representation representation;
            public Lines LinesSet
            {
                set { lines = value; }
            }
            public Representation RepresentationSet
        {
                set { representation = value; }
            }
            public override void Send(string message, TetrisRepresentationAndLines connection)
            {
                if (connection == lines)
                {
                    representation.Notify(message);
                }
                else
                {
                    lines.Notify(message);
                }
            }
        }
    }
