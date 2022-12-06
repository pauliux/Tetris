namespace TetrisClient.gameLogic.Adapter
{
    public class Adapter : Target
    {
        private Adaptee _adaptee;
        private string _typee;
        public Adapter(string type, int level)
        {
            _typee = type;
            this.Level = level;
        }
        public override int GetInformationLinesToChange()
        {
            _adaptee = new Adaptee();

            LinesToChange = _adaptee.GetBombsEffect(_typee, Level);
            return LinesToChange;
        }
        public override int GetInformationCurrentScore()
        {
            _adaptee = new Adaptee();
            LinesToChange = _adaptee.GetBombsEffect(_typee, Level);
            Score = _adaptee.GetBombsScore(_typee, LinesToChange, Level);
            return Score;
        }
    }
}
