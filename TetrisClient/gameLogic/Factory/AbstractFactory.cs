using System;
using TetrisClient.gameLogic.Builder;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic
{
    public abstract class AbstractFactory
    {
        protected Director director = new Director();
        public abstract Unit getTetromino(int offsetX, int offsetY, Random random);
        public abstract Unit getTetromino(int offsetX, int offsetY);
        public abstract Unit getTetromino(int offsetX, int offsetY, Matrix matrix);
        public abstract Unit getBomb();
        public abstract Unit getEvilBomb();
    }
}
