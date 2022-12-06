
using Microsoft.AspNetCore.SignalR.Client;

namespace TetrisClient.gameLogic.Singleton
{
    public sealed class Singleton
    {
        private Singleton() { }
        private static Singleton _instance;
        private static HubConnection _connection;
        private const string Url = "http://127.0.0.1:5000/TetrisHub";
        public static Singleton GetInstance()
        {
            if (_instance == null)
            {
                _instance = new Singleton();
            }
            return _instance;
        }

        public HubConnection GetConnection()
        {
            if(_connection == null)
            {
                _connection = new HubConnectionBuilder()
                .WithUrl(Url)
                .WithAutomaticReconnect()
                .Build();

            }
            return _connection;
        }
    }
}
