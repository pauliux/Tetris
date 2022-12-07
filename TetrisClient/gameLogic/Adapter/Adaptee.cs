namespace TetrisClient.gameLogic.Adapter
{
    public class Adaptee
    {
        public int GetBombsEffect(string type,int level)
        {
            switch (type.ToLower())
            {
                case "angel":
                    if(level < 2)
                        return 2;
                    else
                        return 4;
                case "devil":
                    if (level < 2)
                    {
                        return 1;
                    }
                    else if (level > 8)
                    {
                        return 6;
                    }
                    else
                    {
                        return 3;
                    }
                default: return 0;
            }
        }
        public int GetBombsScore(string type, int influence, int level)
        {
            switch (type.ToLower())
            {
                case "angel":
                    return influence * level * 5 + 200;
                case "devil":
                    return influence * level * 7 + 200;
                default: return 0;
            }
        }
    }
}
