
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Strategy
{
    public class HardDrop : AbstractStrategy
    {
        public HardDrop(AbstractFactory _abstractFactory, TetrominoFigure _tetromino, Representation _representation)
            : base(_abstractFactory, _tetromino, _representation)
        {
        }

        public override void moveDifferently()
        {

            //Drops the current tetromino to as low as possible
            while (CheckIfPossible())
            {
                _tetromino.OffsetY++;
            }
        }
    }
}
