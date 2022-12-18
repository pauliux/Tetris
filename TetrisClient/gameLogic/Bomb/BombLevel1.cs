
using System;
using System.Collections.Generic;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Bomb
{
    public class BombLevel1 : Bombs
    {
        private const int Level = 1;
        private const string ImageEnabled = "/Resources/bomb1.png";
        private const string ImageDisabled = "/Resources/bomb1_disabled.png";

        public BombLevel1() : base(Level, ImageEnabled, ImageDisabled)
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
            int remove = 2;
            ICollection<int> temp2 = new List<int>();
            for (int i = 15; i > 15 - remove; i--)
            {
                temp2.Add(i);
            }
            representation.DeleteRow(temp2);
        }
    }
}
