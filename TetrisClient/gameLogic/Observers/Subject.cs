
using System.Collections.Generic;

namespace TetrisClient.gameLogic.Observers
{
    public abstract class Subject
    {
        public List<Observer> List = new List<Observer>();

        public abstract void Send(string command);

        public abstract void ReceiveMessage(string message);

        public void Subscribe(Observer observer)
        {
            List.Add(observer);
            observer.SetSubject(this);
        }

        public void Unsubscribe(Observer observer)
        {
            int index = List.IndexOf(observer);
            List.RemoveAt(index);
        }
    }
}
