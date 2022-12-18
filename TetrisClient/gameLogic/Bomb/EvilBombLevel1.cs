using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.SignalR.Client;
using Newtonsoft.Json;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Bomb
{
    public class EvilBombLevel1 : Bombs
    {
        private const int Level = 1;
        private const string ImageEnabled = "/Resources/bomb1_evil.png";
        private const string ImageDisabled = "/Resources/bomb1_evil_disabled.png";

        public EvilBombLevel1() : base(Level, ImageEnabled, ImageDisabled)
        {
        }

        public override void Add(Unit c)
        {
            Console.WriteLine("Cannot add to a leaf");
        }

        public override void Remove(Unit c)
        {
            Console.WriteLine("Cannot remove from a leaf");
        }

        public override void Execute(Representation representation)
        {
            Singleton.Singleton singleton = Singleton.Singleton.GetInstance();
            Task.Run(async () =>
                await singleton.GetConnection().InvokeAsync("AddLines", JsonConvert.SerializeObject("1")));
        }
    }
}
