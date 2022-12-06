using System;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Decorator;
using TetrisClient.gameLogic.template;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Factory
{
    public class Level2Factory : LevelTemplate
    {
        private TetrominoComponent _component =
            new TetrominoDecoratorLevel2(new TetrominoDecoratorLevel1(new ConcreteTetrominoComponent()));

        public override Unit GetLevelTetromino(int offsetX, int offsetY, Random random)
        {
            return new TetrominoLevel2(1, offsetX, offsetY, random, _component);
        }

        public override Unit GetLevelTetromino(int offsetX, int offsetY, Matrix matrix)
        {
            return new TetrominoLevel2(1, offsetX, offsetY, matrix, _component);
        }

        public override Unit GetLevelTetromino(int offsetX, int offsetY)
        {
            return new TetrominoLevel2(1, offsetX, offsetY, _component);
        }

        public override Unit GetLevelBomb()
        {
            return new BombLevel2();
        }

        public override Unit GetLevelEvilBomb()
        {
            return new EvilBombLevel2();
        }
    }
}
