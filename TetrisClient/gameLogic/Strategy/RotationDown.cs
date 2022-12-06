
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Strategy
{
    public class RotationDown : AbstractStrategy
    {
        public RotationDown(AbstractFactory abstractFactory, TetrominoFigure tetromino, Representation representation)
            : base(abstractFactory, tetromino, representation)
        {
        }

        public override void MoveDifferently()
        {
            HandleRotation("DOWN");
        }
    }
}
