using TetrisClient.gameLogic.Strategy;

namespace TetrisClient.gameLogic.Interpreter
{
    public class RotateClockwiseExpression : AbstractExpression
    {
        public override void Interpret(TetrisEngine context)
        {
            context.Tetromino.SetStrategy(new RotationUp(context.AbstractFactory, context.Tetromino, context.Representation));
            context.Tetromino.Action();
        }
    }
}
