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
         await singleton.getConnection().InvokeAsync("SendScore", JsonConvert.SerializeObject(TetrisEngine.Score)));
            Task.Run(async () =>
                await singleton.getConnection().InvokeAsync("SendBoard", JsonConvert.SerializeObject(TetrisEngine.Representation.Board)));
            Task.Run(async () =>
                await singleton.getConnection().InvokeAsync("SendTetromino", JsonConvert.SerializeObject(TetrisEngine.Tetromino)));
            Task.Run(async () =>
                await singleton.getConnection().InvokeAsync("SendIsGameOver", TetrisEngine.GameOver));
            Task.Run(async () =>
                await singleton.getConnection().InvokeAsync("SendNextTetromino", JsonConvert.SerializeObject(TetrisEngine.NextTetromino)));
            this.send(message);
        }
    }
}
