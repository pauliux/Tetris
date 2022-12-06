using System;
using System.Collections.Generic;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Command
{
    public class User
    {
        Receiver _receiver = new Receiver();
        List<Command> _commands = new List<Command>();
        int _current;

        public void Undo(int levels)
        {
            Console.WriteLine("\n---- Undo {0} levels ", levels);

            // Perform undo operations
            for (int i = 0; i < levels; i++)
            {
                if (_current > 0)
                {
                    Command command = _commands[--_current];
                    command.UnExecute();
                }
            }
        }

        public void Compute(string @operator, TetrominoFigure operand, Representation representation, AbstractFactory abstractFactory, int removeLine)
        {
            // Create command operation and execute it
            Command command = new ConcreteCommand(_receiver, @operator, operand, representation, abstractFactory, removeLine);
            command.Execute();
            // Add command to undo list
            _commands.Insert(_current,command);
            _current++;
        }

        public TetrominoFigure GetTetraminoFigure(TetrominoFigure tetramino)
        {
            if(_current != 0 && _commands.Count > 0)
            {
                Command command = _commands[_current-1];
                return command.GetTetrominoFigure();
            }
            return tetramino;
        }
        public Representation GetRepresentation(Representation representation)
        {
            if (_current != 0 && _commands.Count > 0)
            {
                Command command = _commands[_current-1];
                return command.GetRepresentation();
            }
            return representation;
        }
    }
}
