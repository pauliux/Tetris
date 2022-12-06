
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Strategy
{
    public class SoftDrop : AbstractStrategy
    {
        public SoftDrop(AbstractFactory abstractFactory, TetrominoFigure tetromino, Representation representation)
            : base(abstractFactory, tetromino, representation)
        {
        }

        public override void MoveDifferently()
        {
            if (CheckIfPossible())
            {
                Tetromino.OffsetY++;
            }
        }

    }
}
