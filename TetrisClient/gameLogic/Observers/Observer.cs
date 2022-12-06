﻿
namespace TetrisClient.gameLogic.Observers
{
    public abstract class Observer
    {
        protected Subject subject;

        public abstract void update(string command);

        public Subject getSubject()
        {
            return this.subject;
        }

        public void setSubject(Subject subject)
        {
            this.subject = subject;
        }
    }
}
