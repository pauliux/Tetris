using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Builder;
using TetrisClient.gameLogic.Decorator;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Level
{
    public class Level2Factory : AbstractFactory
    {
        private TetrominoComponent component =
            new TetrominoDecoratorLevel2(new TetrominoDecoratorLevel1(new ConcreteTetrominoComponent()));
       
        public override Unit getTetromino(int offsetX, int offsetY, Random random)
        {
            //return new TetrominoLevel2(2, offsetX, offsetY, random, component);
            Unit rawUnit = new TetrominoLevel2(2, offsetX, offsetY, random, component);
            IBuilder builder = new BuildTetromino(rawUnit);
            return this.director.getLevel(builder);
        }

        public override Unit getTetromino(int offsetX, int offsetY)
        {
            //return new TetrominoLevel2(2, offsetX, offsetY, component);
            Unit rawUnit = new TetrominoLevel2(2, offsetX, offsetY, component);
            IBuilder builder = new BuildTetromino(rawUnit);
            return this.director.getLevel(builder);
        }

        public override Unit getTetromino(int offsetX, int offsetY, Matrix matrix)
        {
            //return new TetrominoLevel2(2, offsetX, offsetY, matrix, component);
            Unit rawUnit = new TetrominoLevel2(2, offsetX, offsetY, matrix, component);
            IBuilder builder = new BuildTetromino(rawUnit);
            return this.director.getLevel(builder);
        }

        public override Unit getBomb()
        {
            //return new BombLevel2();
            Unit rawUnit = new BombLevel2();
            IBuilder builder = new BuildBomb(rawUnit);
            return this.director.getBomb(builder);
        }
    }
}
