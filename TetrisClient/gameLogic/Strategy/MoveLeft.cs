
using TetrisClient.gameLogic.Tetromino;
using TetrisClient.gameLogic;

namespace TetrisClient
{
    public class MoveLeft : AbstractStrategy
    {
        public MoveLeft(AbstractFactory _abstractFactory, TetrominoFigure _tetromino, Representation _representation)
            : base(_abstractFactory, _tetromino, _representation)
        {
        }

        //Moves the tetromino to the left if allowed
        public override void moveDifferently()
        {

            if (MovePossible(offsetInBoardX: -1, offsetCollisionX: -1))
                _tetromino.OffsetX--;
        }

    }
}
