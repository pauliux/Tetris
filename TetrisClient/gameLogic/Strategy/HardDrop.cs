
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Strategy
{
    public class HardDrop : AbstractStrategy
    {
        public HardDrop(AbstractFactory abstractFactory, TetrominoFigure tetromino, Representation representation)
            : base(abstractFactory, tetromino, representation)
        {
        }

        public override void MoveDifferently()
        {

            //Drops the current tetromino to as low as possible
            while (CheckIfPossible())
            {
                Tetromino.OffsetY++;
            }
        }
    }
}
