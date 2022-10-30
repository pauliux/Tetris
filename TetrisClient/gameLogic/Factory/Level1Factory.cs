using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Decorator;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Level
{
    public class Level1Factory : AbstractFactory
    {
        private TetrominoComponent component = new TetrominoDecoratorLevel1(new ConcreteTetrominoComponent());

        public override Unit getTetromino(int offsetX, int offsetY, Random random)
        {
            return new TetrominoLevel1(1, offsetX, offsetY, random, component);
        }

        public override Unit getTetromino(int offsetX, int offsetY)
        {
            return new TetrominoLevel1(1, offsetX, offsetY, component);
        }

        public override Unit getTetromino(int offsetX, int offsetY, Matrix matrix)
        {
            return new TetrominoLevel1(1, offsetX, offsetY, matrix, component);
        }

        public override Unit getBomb()
        {
            return new BombLevel1();
        }
    }
}
