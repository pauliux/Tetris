using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Tetromino;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Command;

namespace TetrisTests.Commander

{
    class CommanderTests
    {
        [Test]
        public void CheckMovingLeft()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(1);
            User user = new User();
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure Tetramino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            user.Compute("left", Tetramino, representation, _abstractFactory, 0);
            Tetramino = user.getTetraminoFigure(Tetramino);
            Assert.AreEqual(Tetramino.OffsetX, 3);
        }

        [Test]
        public void CheckMovingRight()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(1);
            User user = new User();
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure Tetramino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            user.Compute("right", Tetramino, representation, _abstractFactory, 0);
            Tetramino = user.getTetraminoFigure(Tetramino);
            Assert.AreEqual(Tetramino.OffsetX, 5);
        }

        [Test]
        public void CheckRotatingLeft()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(1);
            User user = new User();
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure Tetramino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            TetrominoFigure TetraminoTemp = Tetramino;
            user.Compute("UP", Tetramino, representation, _abstractFactory, 0);
            Tetramino = user.getTetraminoFigure(Tetramino);
            TetraminoTemp.Matrix.Rotate90();
            Assert.AreEqual(TetraminoTemp.Matrix, Tetramino.Matrix);
        }

        [Test]
        public void CheckRotatingRight()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(1);
            User user = new User();
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure Tetramino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            TetrominoFigure TetraminoTemp = Tetramino;
            user.Compute("DOWN", Tetramino, representation, _abstractFactory, 0);
            Tetramino = user.getTetraminoFigure(Tetramino);
            TetraminoTemp.Matrix.Rotate90CounterClockwise();
            Assert.AreEqual(TetraminoTemp.Matrix, Tetramino.Matrix);
        }

        [Test]
        public void CheckPlacingBlock()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(1);
            User user = new User();
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure Tetramino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            user.Compute("HARDDROP", Tetramino, representation, _abstractFactory, 0);
            Tetramino = user.getTetraminoFigure(Tetramino);
            Console.WriteLine("saf");
            Assert.AreEqual(Tetramino.OffsetY, 14);
        }

        [Test]
        public void CheckAngelBomb()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(1);
            User user = new User();
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure Tetramino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 14) : (TetrominoFigure)_abstractFactory.getTetromino(4, 14, _random);
            representation.PutTetrominoInBoard(Tetramino);
            user.Compute("ANGELBOMB", Tetramino, representation, _abstractFactory, 3);
            representation = user.getRepresentation(representation);
            Assert.AreEqual(representation.Board, (new Representation()).Board);
        }

        [Test]
        public void CheckUndoCommandLeft()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(1);
            User user = new User();
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure Tetramino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            user.Compute("left", Tetramino, representation, _abstractFactory, 0);
            Tetramino = user.getTetraminoFigure(Tetramino);
            user.Undo(1);
            Assert.AreEqual(Tetramino.OffsetX, 4);
        }

        [Test]
        public void CheckUndoCommandRight()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(1);
            User user = new User();
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure Tetramino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            user.Compute("right", Tetramino, representation, _abstractFactory, 0);
            Tetramino = user.getTetraminoFigure(Tetramino);
            user.Undo(1);
            Assert.AreEqual(Tetramino.OffsetX, 4);
        }
        [Test]
        public void CheckUndoCommandUP()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(1);
            User user = new User();
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure Tetramino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            TetrominoFigure tempTetramino = Tetramino;
            user.Compute("UP", Tetramino, representation, _abstractFactory, 0);
            Tetramino = user.getTetraminoFigure(Tetramino);
            user.Undo(1);
            Assert.AreEqual(Tetramino.Matrix, tempTetramino.Matrix);
        }
        [Test]
        public void CheckUndoCommandDOWN()
        {
            Representation representation = new Representation();
            Random _random = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(1);
            User user = new User();
            AbstractFactory _abstractFactory = _level.GetAbstractFactory();
            TetrominoFigure Tetramino = _random == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random);
            TetrominoFigure tempTetramino = Tetramino;
            user.Compute("DOWN", Tetramino, representation, _abstractFactory, 0);
            Tetramino = user.getTetraminoFigure(Tetramino);
            user.Undo(1);
            Assert.AreEqual(Tetramino.Matrix, tempTetramino.Matrix);
        }
    }
}
