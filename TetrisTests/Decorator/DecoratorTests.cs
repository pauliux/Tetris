
using TetrisClient.gameLogic.Decorator;

namespace TetrisTests.Decorator
{
    public class DecoratorTests
    {
        [Test]
        public void GetConcreteComponent()
        {
            TetrominoComponent component = new ConcreteTetrominoComponent();
            var mapOfTetrominos = component.getTetrominos();
            Assert.IsTrue(mapOfTetrominos.ContainsKey('O'));
            Assert.IsFalse(mapOfTetrominos.ContainsKey('I'));
            Assert.IsFalse(mapOfTetrominos.ContainsKey('S'));
        }

        [Test]
        public void GetLevel1Decorator()
        {
            TetrominoComponent component = new TetrominoDecoratorLevel1(new ConcreteTetrominoComponent());
            var mapOfTetrominos = component.getTetrominos();
            Assert.IsTrue(mapOfTetrominos.ContainsKey('O'));
            Assert.IsTrue(mapOfTetrominos.ContainsKey('I'));
            Assert.IsFalse(mapOfTetrominos.ContainsKey('S'));
        }

        [Test]
        public void GetLevel2Decorator()
        {
            TetrominoComponent component = new TetrominoDecoratorLevel2(new TetrominoDecoratorLevel1(new ConcreteTetrominoComponent()));
            var mapOfTetrominos = component.getTetrominos();
            Assert.IsTrue(mapOfTetrominos.ContainsKey('O'));
            Assert.IsTrue(mapOfTetrominos.ContainsKey('I'));
            Assert.IsTrue(mapOfTetrominos.ContainsKey('S'));
        }
    }
}
