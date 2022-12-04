using System;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Decorator;
using TetrisClient.gameLogic.template;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Factory
{
    public class Level2Factory : LevelTemplate
    {
        private TetrominoComponent component =
            new TetrominoDecoratorLevel2(new TetrominoDecoratorLevel1(new ConcreteTetrominoComponent()));

        public override Unit getLevelTetromino(int offsetX, int offsetY, Random random)
        {
            return new TetrominoLevel2(1, offsetX, offsetY, random, component);
        }

        public override Unit getLevelTetromino(int offsetX, int offsetY, Matrix matrix)
        {
            return new TetrominoLevel2(1, offsetX, offsetY, matrix, component);
        }

        public override Unit getLevelTetromino(int offsetX, int offsetY)
        {
            return new TetrominoLevel2(1, offsetX, offsetY, component);
        }

        public override Unit getLevelBomb()
        {
            return new BombLevel2();
        }

        public override Unit getLevelEvilBomb()
        {
            return new EvilBombLevel2();
        }
    }
}
