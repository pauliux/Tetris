using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Builder;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Level
{
    public class Level1Factory : AbstractFactory
    {
        public override Unit getTetromino(int offsetX, int offsetY, Random random)
        {
            //return new TetrominoLevel1(1, offsetX, offsetY, random);
            Unit rawUnit = new TetrominoLevel1(1, offsetX, offsetY, random);
            rawUnit.Clone();
            IBuilder builder = new BuildTetromino(rawUnit);
            return this.director.getLevel(builder);
        }

        public override Unit getTetromino(int offsetX, int offsetY)
        {
            //return new TetrominoLevel1(1, offsetX, offsetY);
            Unit rawUnit = new TetrominoLevel1(1, offsetX, offsetY);
            IBuilder builder = new BuildTetromino(rawUnit);
            return this.director.getLevel(builder);
        }

        public override Unit getTetromino(int offsetX, int offsetY, Matrix matrix)
        {
            //return new TetrominoLevel1(1, offsetX, offsetY, matrix);
            Unit rawUnit = new TetrominoLevel1(1, offsetX, offsetY, matrix);
            IBuilder builder = new BuildTetromino(rawUnit);
            return this.director.getLevel(builder);
        }

        public override Unit getBomb()
        {
            //return new BombLevel1();
            Unit rawUnit = new BombLevel1();
            IBuilder builder = new BuildBomb(rawUnit);
            return this.director.getBomb(builder);
        }
    }
}
