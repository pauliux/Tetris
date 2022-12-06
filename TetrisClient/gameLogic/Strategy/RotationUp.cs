
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Strategy
{
    public class RotationUp : AbstractStrategy
    {
        public RotationUp(AbstractFactory abstractFactory, TetrominoFigure tetromino, Representation representation)
            : base(abstractFactory, tetromino, representation)
        {
        }

        public override void MoveDifferently()
        {
            HandleRotation("UP");
        }
    }
}
