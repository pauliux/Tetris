using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR.Client;
using Newtonsoft.Json;

namespace TetrisClient.gameLogic.Observers
{
    public class ConcreteSubject : Subject
    {
        private Singleton.Singleton _singleton = Singleton.Singleton.GetInstance();
        private TetrisEngine _engine;

        public ConcreteSubject(TetrisEngine engine)
        {
            this._engine = engine;
        }

        public override void Send(string command)
        {
            foreach (Observer observer in List)
            {
                observer.Update(command);
            }
        }

        public override void ReceiveMessage(string message)
        {
            Task.Run(async () =>
                await _singleton.GetConnection().InvokeAsync("SendScore", JsonConvert.SerializeObject(_engine.Score)));
            Task.Run(async () =>
                await _singleton.GetConnection().InvokeAsync("SendBoard", JsonConvert.SerializeObject(_engine.Representation.Board)));
            Task.Run(async () =>
                await _singleton.GetConnection().InvokeAsync("SendTetromino", JsonConvert.SerializeObject(_engine.Tetromino)));
            Task.Run(async () =>
                await _singleton.GetConnection().InvokeAsync("SendIsGameOver", _engine.GameOver));
            Task.Run(async () =>
                await _singleton.GetConnection().InvokeAsync("SendNextTetromino", JsonConvert.SerializeObject(_engine.NextTetromino)));
            this.Send(message);
        }
    }
}