using System;
using TetrisClient.gameLogic.Tetromino;
using System.Diagnostics.CodeAnalysis;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Command
{
    public class ConcreteCommand : Command
    {
        string _operator;
        TetrominoFigure _operand;
        Representation _representation;
        Receiver _receiver;
        AbstractFactory _abstractFactory;
        int _removeLine;
        // Constructor
        public ConcreteCommand(Receiver receiver,
            string @operator, TetrominoFigure operand, Representation representation, AbstractFactory abstractFactory, int removeLine)
        {
            this._receiver = receiver;
            this._operator = @operator;
            this._operand = operand;
            this._representation = representation;
            this._abstractFactory = abstractFactory;
            this._removeLine = removeLine;
        }
        // Gets operator
        [ExcludeFromCodeCoverage]
        public string Operator
        {
            set { _operator = value; }
        }
        // Get operand
        [ExcludeFromCodeCoverage]
        public TetrominoFigure Operand
        {
            set { _operand = value; }
        }
        [ExcludeFromCodeCoverage]
        public Representation Representation
        {
            set { _representation = value; }
        }
        // Execute new command
        public override void Execute()
        {
            _receiver.Operation(_operator, _operand, _representation, _abstractFactory, _removeLine);
        }
        // Unexecute last command
        public override void UnExecute()
        {
            _receiver.Operation(Undo(_operator), _operand, _representation, _abstractFactory, _removeLine);
        }
        public override TetrominoFigure GetTetrominoFigure()
        {
            return _receiver.GetFigure();
        }
        public override Representation GetRepresentation()
        {
            return _receiver.GetRepresentation();
        }
        // Returns opposite operator for given operator
        [ExcludeFromCodeCoverage]
        private string Undo(string @operator)
        {
            switch (@operator)
            {
                case "left": return "right";
                case "right": return "left";
                case "UP": return "DOWN";
                case "DOWN": return "UP";
                case "HARDDROP": return "HARDJUMP";
                case "ANGELBOMB": return "ANGELBOMBHASNO";
                default:
                    throw new
             ArgumentException("@operator");
            }
        }
    }
}
