using TetrisClient.gameLogic.Strategy;

namespace TetrisClient.gameLogic.Interpreter
{
    public class RotateCounterClockwiseExpression : AbstractExpression
    {
        public override void Interpret(TetrisEngine context)
        {
            context.Tetromino.SetStrategy(new RotationDown(context.AbstractFactory, context.Tetromino, context.Representation));
            context.Tetromino.Action();
        }
    }
}
