
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Strategy
{
    public class RotationUp : AbstractStrategy
    {
        public RotationUp(AbstractFactory _abstractFactory, TetrominoFigure _tetromino, Representation _representation)
            : base(_abstractFactory, _tetromino, _representation)
        {
        }

        public override void moveDifferently()
        {
            HandleRotation("UP");
        }
    }
}
