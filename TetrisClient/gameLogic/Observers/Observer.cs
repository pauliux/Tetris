
namespace TetrisClient.gameLogic.Observers
{
    public abstract class Observer
    {
        protected Subject Subject;

        public abstract void Update(string command);

        public Subject GetSubject()
        {
            return this.Subject;
        }

        public void SetSubject(Subject subject)
        {
            this.Subject = subject;
        }
    }
}
