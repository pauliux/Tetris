using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic;
using TetrisClient;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Command
{
    public class ConcreteCommand : Command
    {
        string @operator;
        TetrominoFigure operand;
        Representation representation;
        Receiver receiver;
        AbstractFactory abstractFactory;
        // Constructor
        public ConcreteCommand(Receiver receiver,
            string @operator, TetrominoFigure operand, Representation representation, AbstractFactory abstractFactory)
        {
            this.receiver = receiver;
            this.@operator = @operator;
            this.operand = operand;
            this.representation = representation;
            this.abstractFactory = abstractFactory;
        }
        // Gets operator
        public string Operator
        {
            set { @operator = value; }
        }
        // Get operand
        public TetrominoFigure Operand
        {
            set { operand = value; }
        }
        public Representation Representation
        {
            set { representation = value; }
        }
        // Execute new command
        public override void Execute()
        {
            receiver.Operation(@operator, operand, representation, abstractFactory);
        }
        // Unexecute last command
        public override void UnExecute()
        {
            receiver.Operation(Undo(@operator), operand, representation, abstractFactory);
        }
        public override TetrominoFigure GetTetrominoFigure()
        {
            return receiver.getFigure();
        }
        public override Representation GetRepresentation()
        {
            return receiver.getRepresentation();
        }
        // Returns opposite operator for given operator
        private string Undo(string @operator)
        {
            switch (@operator)
            {
                case "left": return "right";
                case "right": return "left";
                case "UP": return "DOWN";
                case "DOWN": return "UP";
                case "HARDDROP": return "HARDJUMP";
                case "ANGELBOMB2": return "ANGELBOMB";
                case "ANGELBOMB4": return "ANGELBOMB";
                default:
                    throw new
             ArgumentException("@operator");
            }
        }
    }
}
