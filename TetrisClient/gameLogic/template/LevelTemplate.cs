using System;
using TetrisClient.gameLogic.Builder;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.template
{
    public abstract class LevelTemplate : AbstractFactory
    {
        public abstract Unit GetLevelTetromino(int offsetX, int offsetY, Random random);
        public abstract Unit GetLevelTetromino(int offsetX, int offsetY, Matrix matrix);
        public abstract Unit GetLevelTetromino(int offsetX, int offsetY);
        public abstract Unit GetLevelBomb();
        public abstract Unit GetLevelEvilBomb();

        public override Unit GetTetromino(int offsetX, int offsetY, Random random)
        {
            Unit rawUnit = GetLevelTetromino(offsetX, offsetY, random);
            Builder.Builder builder = new BuildTetromino((Unit)rawUnit.Clone());
            return this.Director.GetLevel(builder);
        }

        public override Unit GetTetromino(int offsetX, int offsetY)
        {
            Unit rawUnit = GetLevelTetromino(offsetX, offsetY);
            Builder.Builder builder = new BuildTetromino(rawUnit);
            return this.Director.GetLevel(builder);
        }

        public override Unit GetTetromino(int offsetX, int offsetY, Matrix matrix)
        {
            Unit rawUnit = GetLevelTetromino(offsetX, offsetY, matrix);
            Builder.Builder builder = new BuildTetromino(rawUnit);
            return this.Director.GetLevel(builder);
        }

        public override Unit GetBomb()
        {
            Unit rawUnit = GetLevelBomb();
            Builder.Builder builder = new BuildBomb(rawUnit);
            return this.Director.GetBomb(builder);
        }

        public override Unit GetEvilBomb()
        {
            Unit rawUnit = GetLevelEvilBomb();
            Builder.Builder builder = new BuildBomb(rawUnit);
            return this.Director.GetBomb(builder);
        }
    }
}
