using Microsoft.AspNetCore.SignalR.Client;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Observers;
using TetrisClient.gameLogic.Singleton;

namespace TetrisClient
{
    public class ConcreteSubject : Subject
    {
        private Singleton singleton = Singleton.GetInstance();
        private TetrisEngine _engine;

        public ConcreteSubject(TetrisEngine engine)
        {
            this._engine = engine;
        }

        public override void send(string command)
        {
            foreach (Observer observer in list)
            {
                observer.update(command);
            }
        }

        public override void receiveMessage(string message)
        {
            Task.Run(async () =>
                await singleton.getConnection().InvokeAsync("SendScore", JsonConvert.SerializeObject(_engine.Score)));
            Task.Run(async () =>
                await singleton.getConnection().InvokeAsync("SendBoard", JsonConvert.SerializeObject(_engine.Representation.Board)));
            Task.Run(async () =>
                await singleton.getConnection().InvokeAsync("SendTetromino", JsonConvert.SerializeObject(_engine.Tetromino)));
            Task.Run(async () =>
                await singleton.getConnection().InvokeAsync("SendIsGameOver", _engine.GameOver));
            Task.Run(async () =>
                await singleton.getConnection().InvokeAsync("SendNextTetromino", JsonConvert.SerializeObject(_engine.NextTetromino)));
            this.send(message);
        }
    }
}