using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Observers
{
    public abstract class Subject
    {
        protected List<Observer> list = new List<Observer>();

        public abstract void send(string command);

        public abstract void receiveMessage(string message);

        public void subscribe(Observer observer)
        {
            list.Add(observer);
            observer.setSubject(this);
        }

        public void unsubscribe(Observer observer)
        {
            int index = list.IndexOf(observer);
            list.RemoveAt(index);
        }
    }
}
