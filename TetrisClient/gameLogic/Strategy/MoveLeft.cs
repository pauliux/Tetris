using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Strategy
{
    public class MoveLeft : AbstractStrategy
    {
        public MoveLeft(AbstractFactory abstractFactory, TetrominoFigure tetromino, Representation representation)
            : base(abstractFactory, tetromino, representation)
        {
        }

        //Moves the tetromino to the left if allowed
        public override void MoveDifferently()
        {

            if (MovePossible(offsetInBoardX: -1, offsetCollisionX: -1))
                Tetromino.OffsetX--;
        }

    }
}
