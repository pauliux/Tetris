
using System.Collections.Generic;

namespace TetrisClient.gameLogic.Observers
{
    public abstract class Subject
    {
        public List<Observer> list = new List<Observer>();

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
