

namespace TetrisClient.gameLogic.Interpreter
{
    public class Rotate180DegreesExpression : AbstractExpression
    {
        private AbstractExpression _clockwiseExpression;

        public Rotate180DegreesExpression()
        {
            _clockwiseExpression = new RotateClockwiseExpression();
        }

        public override void Interpret(TetrisEngine context)
        {
            _clockwiseExpression.Interpret(context);
            _clockwiseExpression.Interpret(context);
        }
    }
}
