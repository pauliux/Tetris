
using Microsoft.AspNetCore.SignalR.Client;

namespace TetrisClient.gameLogic.Singleton
{
    public sealed class Singleton
    {
        private Singleton() { }
        private static Singleton instance;
        private static HubConnection _connection;
        private const string url = "http://127.0.0.1:5000/TetrisHub";
        public static Singleton GetInstance()
        {
            if (instance == null)
            {
                instance = new Singleton();
            }
            return instance;
        }

        public HubConnection getConnection()
        {
            if(_connection == null)
            {
                _connection = new HubConnectionBuilder()
                .WithUrl(url)
                .WithAutomaticReconnect()
                .Build();

            }
            return _connection;
        }
    }
}
