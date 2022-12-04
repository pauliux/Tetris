using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Builder;
using TetrisClient.gameLogic.Decorator;
using TetrisClient.gameLogic.EvilBomb;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.template
{
    public abstract class LevelTemplate : AbstractFactory
    {
        public abstract Unit getLevelTetromino(int offsetX, int offsetY, Random random);
        public abstract Unit getLevelTetromino(int offsetX, int offsetY, Matrix matrix);
        public abstract Unit getLevelTetromino(int offsetX, int offsetY);
        public abstract Unit getLevelBomb();
        public abstract Unit getLevelEvilBomb();

        public override Unit getTetromino(int offsetX, int offsetY, Random random)
        {
            Unit rawUnit = getLevelTetromino(offsetX, offsetY, random);
            rawUnit.Clone();
            IBuilder builder = new BuildTetromino(rawUnit);
            return this.director.getLevel(builder);
        }

        public override Unit getTetromino(int offsetX, int offsetY)
        {
            Unit rawUnit = getLevelTetromino(offsetX, offsetY);
            IBuilder builder = new BuildTetromino(rawUnit);
            return this.director.getLevel(builder);
        }

        public override Unit getTetromino(int offsetX, int offsetY, Matrix matrix)
        {
            Unit rawUnit = getLevelTetromino(offsetX, offsetY, matrix);
            IBuilder builder = new BuildTetromino(rawUnit);
            return this.director.getLevel(builder);
        }

        public override Unit getBomb()
        {
            Unit rawUnit = getLevelBomb();
            IBuilder builder = new BuildBomb(rawUnit);
            return this.director.getBomb(builder);
        }

        public override Unit getEvilBomb()
        {
            Unit rawUnit = getLevelEvilBomb();
            IBuilder builder = new BuildBomb(rawUnit);
            return this.director.getBomb(builder);
        }
    }
}
