
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Tetromino;
using TetrisClient.gameLogic.Strategy;

namespace TetrisTests.Strategy
{
    public class StrategyTests
    {
        [Test]
        public void HardDropCheck()
        {
            Representation representation = new Representation();
            Random random = new Random(20);
            Creator creator = new LevelCreator();
            Level level = creator.GetLevel(2);
            AbstractFactory abstractFactory = level.GetAbstractFactory();
            TetrominoFigure tetromino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
            tetromino.SetStrategy(new HardDrop(abstractFactory, tetromino, representation));
            tetromino.Action();
            Assert.That(tetromino.OffsetY, Is.EqualTo(14));
        }

        [Test]
        public void SoftDropCheck()
        {
            Representation representation = new Representation();
            Random random = new Random(20);
            Creator creator = new LevelCreator();
            Level level = creator.GetLevel(2);
            AbstractFactory abstractFactory = level.GetAbstractFactory();
            TetrominoFigure tetromino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
            tetromino.SetStrategy(new SoftDrop(abstractFactory, tetromino, representation));
            tetromino.Action();
            Assert.That(tetromino.OffsetY, Is.EqualTo(1));
        }

        [Test]
        public void RotationDownCheck()
        {
            Representation representation = new Representation();
            Random random = new Random(20);
            Creator creator = new LevelCreator();
            Level level = creator.GetLevel(2);
            AbstractFactory abstractFactory = level.GetAbstractFactory();
            TetrominoFigure tetromino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
            TetrominoFigure tetromino2 = tetromino;
            tetromino.SetStrategy(new RotationDown(abstractFactory, tetromino, representation));
            tetromino.Action();
            Matrix expected = tetromino2.Matrix.Rotate90CounterClockwise();
            Assert.That(tetromino.Matrix.Value, Is.EqualTo(expected.Value));
        }

        [Test]
        public void RotationUpCheck()
        {
            Representation representation = new Representation();
            Random random = new Random(20);
            Creator creator = new LevelCreator();
            Level level = creator.GetLevel(2);
            AbstractFactory abstractFactory = level.GetAbstractFactory();
            TetrominoFigure tetromino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
            TetrominoFigure tetromino2 = tetromino;
            tetromino.SetStrategy(new RotationUp(abstractFactory, tetromino, representation));
            tetromino.Action();
            Matrix expected = tetromino2.Matrix.Rotate90();
            Assert.That(tetromino.Matrix.Value, Is.EqualTo(expected.Value));
        }

        [Test]
        public void MoveLeftCheck()
        {
            Representation representation = new Representation();
            Random random = new Random(20);
            Creator creator = new LevelCreator();
            Level level = creator.GetLevel(2);
            AbstractFactory abstractFactory = level.GetAbstractFactory();
            TetrominoFigure tetromino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
            tetromino.SetStrategy(new MoveLeft(abstractFactory, tetromino, representation));
            tetromino.Action();
            Assert.That(tetromino.OffsetX, Is.EqualTo(3));
        }

        [Test]
        public void MoveRightCheck()
        {
            Representation representation = new Representation();
            Random random = new Random(20);
            Creator creator = new LevelCreator();
            Level level = creator.GetLevel(2);
            AbstractFactory abstractFactory = level.GetAbstractFactory();
            TetrominoFigure tetromino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
            tetromino.SetStrategy(new MoveRight(abstractFactory, tetromino, representation));
            tetromino.Action();
            Assert.That(tetromino.OffsetX, Is.EqualTo(5));
        }

    }
}
