using System;
using System.Collections.Generic;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Command
{
    public class User
    {
        Receiver receiver = new Receiver();
        List<Command> commands = new List<Command>();
        int current = 0;

        //public void Redo(int levels)
        //{
        //    Console.WriteLine("\n---- Redo {0} levels ", levels);
        //    // Perform redo operations
        //    temp = current - levels;
        //    for (int i = 0; i < levels; i++)
        //    {
        //        if (current < commands.Count - 1)
        //        {
        //            Command command = commands[current++];
        //            command.Execute();
        //        }
        //    }
        //}

        public void Undo(int levels)
        {
            Console.WriteLine("\n---- Undo {0} levels ", levels);

            // Perform undo operations
            for (int i = 0; i < levels; i++)
            {
                if (current > 0)
                {
                    Command command = commands[--current] as Command;
                    command.UnExecute();
                }
            }
        }

        public void Compute(string @operator, TetrominoFigure operand, Representation representation, AbstractFactory abstractFactory, int removeLine)
        {
            // Create command operation and execute it
            Command command = new ConcreteCommand(receiver, @operator, operand, representation, abstractFactory, removeLine);
            command.Execute();
            // Add command to undo list
            commands.Insert(current,command);
            current++;
        }

        public TetrominoFigure getTetraminoFigure(TetrominoFigure tetramino)
        {
            if(current != 0 && commands.Count > 0)
            {
                Command command = commands[current-1];
                return command.GetTetrominoFigure();
            }
            return tetramino;
        }
        public Representation getRepresentation(Representation representation)
        {
            if (current != 0 && commands.Count > 0)
            {
                Command command = commands[current-1];
                return command.GetRepresentation();
            }
            return representation;
        }
    }
}
