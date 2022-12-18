

//using TetrisClient.gameLogic;
//using TetrisClient.gameLogic.Factory;
//using TetrisClient.gameLogic.Tetromino;
//using TetrisClient.gameLogic.Level;
//using TetrisClient.gameLogic.Command;

//namespace TetrisTests.Commander

//{
//    class CommanderTests
//    {
//        [Test]
//        public void CheckMovingLeft()
//        {
//            Representation representation = new Representation();
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
//            user.Compute("left", tetramino, representation, abstractFactory, 0);
//            tetramino = user.GetTetraminoFigure(tetramino);
//            Assert.AreEqual(tetramino.OffsetX, 3);
//        }

//        [Test]
//        public void CheckMovingRight()
//        {
//            Representation representation = new Representation();
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
//            user.Compute("right", tetramino, representation, abstractFactory, 0);
//            tetramino = user.GetTetraminoFigure(tetramino);
//            Assert.AreEqual(tetramino.OffsetX, 5);
//        }

//        [Test]
//        public void CheckRotatingLeft()
//        {
//            Representation representation = new Representation();
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
//            TetrominoFigure tetraminoTemp = tetramino;
//            user.Compute("UP", tetramino, representation, abstractFactory, 0);
//            tetramino = user.GetTetraminoFigure(tetramino);
//            tetraminoTemp.Matrix = tetraminoTemp.Matrix.Rotate90();
//            Assert.AreEqual(tetraminoTemp.Matrix, tetramino.Matrix);
//        }

//        [Test]
//        public void CheckRotatingRight()
//        {
//            Representation representation = new Representation();
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
//            TetrominoFigure tetraminoTemp = tetramino;
//            user.Compute("DOWN", tetramino, representation, abstractFactory, 0);
//            tetramino = user.GetTetraminoFigure(tetramino);
//            tetraminoTemp.Matrix = tetraminoTemp.Matrix.Rotate90CounterClockwise();
//            Assert.AreEqual(tetraminoTemp.Matrix, tetramino.Matrix);
//        }

//        [Test]
//        public void CheckPlacingBlock()
//        {
//            Representation representation = new Representation();
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
//            user.Compute("HARDDROP", tetramino, representation, abstractFactory, 0);
//            tetramino = user.GetTetraminoFigure(tetramino);
//            Assert.AreEqual(tetramino.OffsetY, 14);
//        }

//        [Test]
//        public void CheckAngelBomb()
//        {
//            Representation representation = new Representation();
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 14, random);
//            representation.PutTetrominoInBoard(tetramino);
//            user.Compute("ANGELBOMB", tetramino, representation, abstractFactory, 3);
//            representation = user.GetRepresentation(representation);
//            Assert.AreEqual(representation.Board, (new Representation()).Board);
//        }

//        [Test]
//        public void CheckUndoCommandLeft()
//        {
//            Representation representation = new Representation();
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
//            user.Compute("left", tetramino, representation, abstractFactory, 0);
//            tetramino = user.GetTetraminoFigure(tetramino);
//            user.Undo(1);
//            Assert.AreEqual(tetramino.OffsetX, 4);
//        }

//        [Test]
//        public void CheckUndoCommandRight()
//        {
//            Representation representation = new Representation();
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
//            user.Compute("right", tetramino, representation, abstractFactory, 0);
//            tetramino = user.GetTetraminoFigure(tetramino);
//            user.Undo(1);
//            Assert.AreEqual(tetramino.OffsetX, 4);
//        }
//        [Test]
//        public void CheckUndoCommandUp()
//        {
//            Representation representation = new Representation();
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
//            TetrominoFigure tempTetramino = tetramino;
//            user.Compute("UP", tetramino, representation, abstractFactory, 0);
//            tetramino = user.GetTetraminoFigure(tetramino);
//            user.Undo(1);
//            Assert.AreEqual(tetramino.Matrix, tempTetramino.Matrix);
//        }
//        [Test]
//        public void CheckUndoCommandDown()
//        {
//            Representation representation = new Representation();
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
//            TetrominoFigure tempTetramino = tetramino;
//            user.Compute("DOWN", tetramino, representation, abstractFactory, 0);
//            tetramino = user.GetTetraminoFigure(tetramino);
//            user.Undo(1);
//            Assert.AreEqual(tetramino.Matrix, tempTetramino.Matrix);
//        }
//        [Test]
//        public void CheckCommanderTetraminoNoCommandReturn()
//        {
//            Random random = new Random(20);
//            Creator creator = new LevelCreator();
//            Level level = creator.GetLevel(1);
//            User user = new User();
//            AbstractFactory abstractFactory = level.GetAbstractFactory();
//            TetrominoFigure tetramino = (TetrominoFigure)abstractFactory.GetTetromino(4, 0, random);
//            TetrominoFigure tempTetramino = tetramino;
//            tetramino = user.GetTetraminoFigure(tetramino);
//            user.Undo(1);
//            Assert.AreEqual(tetramino.Matrix, tempTetramino.Matrix);
//        }
//        [Test]
//        public void CheckCommanderRepresentationNoCommandReturn()
//        {
//            Representation representation = new Representation();
//            User user = new User();

//            Representation temprep = representation;
//            representation = user.GetRepresentation(representation);
//            user.Undo(1);
//            Assert.AreEqual(representation.Board, temprep.Board);
//        }
//    }
//}
