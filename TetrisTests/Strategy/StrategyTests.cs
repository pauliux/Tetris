using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Tetromino;
using TetrisClient.gameLogic.Strategy;
using TetrisClient;

namespace TetrisTests.Strategy
{
    public class StrategyTests
    {
        [Test]
        public void HardDropCheck()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(2);
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure tetromino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            tetromino.setStrategy(new HardDrop(_abstractFactory, tetromino, representation));
            tetromino.action();
            Assert.That(tetromino.OffsetY, Is.EqualTo(14));
        }

        [Test]
        public void SoftDropCheck()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(2);
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure tetromino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            tetromino.setStrategy(new SoftDrop(_abstractFactory, tetromino, representation));
            tetromino.action();
            Assert.That(tetromino.OffsetY, Is.EqualTo(1));
        }

        [Test]
        public void RotationDownCheck()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(2);
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure tetromino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            TetrominoFigure tetromino2 = tetromino;
            tetromino.setStrategy(new RotationDown(_abstractFactory, tetromino, representation));
            tetromino.action();
            Matrix expected = tetromino2.Matrix.Rotate90CounterClockwise();
            Assert.That(tetromino.Matrix.Value, Is.EqualTo(expected.Value));
        }

        [Test]
        public void RotationUpCheck()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(2);
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure tetromino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            TetrominoFigure tetromino2 = tetromino;
            tetromino.setStrategy(new RotationUp(_abstractFactory, tetromino, representation));
            tetromino.action();
            Matrix expected = tetromino2.Matrix.Rotate90();
            Assert.That(tetromino.Matrix.Value, Is.EqualTo(expected.Value));
        }

        [Test]
        public void MoveLeftCheck()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(2);
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure tetromino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            tetromino.setStrategy(new MoveLeft(_abstractFactory, tetromino, representation));
            tetromino.action();
            Assert.That(tetromino.OffsetX, Is.EqualTo(3));
        }

        [Test]
        public void MoveRightCheck()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(2);
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure tetromino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            tetromino.setStrategy(new MoveRight(_abstractFactory, tetromino, representation));
            tetromino.action();
            Assert.That(tetromino.OffsetX, Is.EqualTo(5));
        }

    }
}
