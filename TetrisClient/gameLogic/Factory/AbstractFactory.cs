using System;
using TetrisClient.gameLogic.Builder;

namespace TetrisClient.gameLogic.Factory
{
    public abstract class AbstractFactory
    {
        protected Director Director = new Director();
        public abstract Unit GetTetromino(int offsetX, int offsetY, Random random);
        public abstract Unit GetTetromino(int offsetX, int offsetY);
        public abstract Unit GetTetromino(int offsetX, int offsetY, Matrix matrix);
        public abstract Unit GetBomb();
        public abstract Unit GetEvilBomb();
    }
}
