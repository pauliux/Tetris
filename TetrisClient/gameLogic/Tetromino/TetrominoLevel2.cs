using System;
using TetrisClient.gameLogic.Factory;
using TetrominoComponent = TetrisClient.gameLogic.Decorator.TetrominoComponent;

namespace TetrisClient.gameLogic.Tetromino
{
    public class TetrominoLevel2 : TetrominoFigure
    {
        public TetrominoLevel2(int level, int offsetX, int offsetY, Random random, TetrominoComponent component) : base(level, offsetX, offsetY, random, component)
        {
        }

        public TetrominoLevel2(int level, int offsetX, int offsetY, TetrominoComponent component) : base(level, offsetX, offsetY, component)
        {
        }

        public TetrominoLevel2(int level, int offsetX, int offsetY, Matrix matrix, TetrominoComponent component) : base(level, offsetX, offsetY, matrix, component)
        {
        }

        public override void Add(Unit c)
        {
            throw new NotImplementedException();
        }

        public override void Remove(Unit c)
        {
            throw new NotImplementedException();
        }

        public override void Execute(Representation representation)
        {
            throw new NotImplementedException();
        }
    }
}
