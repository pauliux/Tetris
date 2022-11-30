using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Moq;
using TetrisClient;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Observers;
using TetrisClient.gameLogic.Strategy;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisTests.Observers
{
    class ObserverTests
    {
        private Subject subject;
        private List<Observer> expected;
        TetrominoFigure tetromino1;
        TetrominoFigure tetromino2;
        Representation _representation;
        AbstractFactory _abstractFactory;

        [SetUp]
        public void SetUp()
        {
            subject = new ConcreteSubject(new TetrisEngine());
            expected = new List<Observer>();
            _representation = new Representation();
            Random _random1 = new Random((int)20);
            Random _random2 = new Random((int)20);
            Creator _creator = new LevelCreator();
            Level _level = _creator.GetLevel(2);
            _abstractFactory = _level.GetAbstractFactory();
            tetromino1 = _random1 == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random1);
            tetromino2 = _random2 == null ? (TetrominoFigure)_abstractFactory.getTetromino(4, 0) : (TetrominoFigure)_abstractFactory.getTetromino(4, 0, _random2);
            subject.subscribe(tetromino1);
            subject.subscribe(tetromino2);
            expected.Add(tetromino1);
            expected.Add(tetromino2);
        }

        [Test]
        public void Subscribe()
        {
            Assert.Multiple(() =>
            {
                Assert.That(subject.list.Count, Is.EqualTo(expected.Count));
            });

        }

        [Test]
        public void Unsubscribe()
        {
            subject.unsubscribe(tetromino1);
            subject.unsubscribe(tetromino2);
            Assert.Multiple(() =>
            {
                Assert.That(subject.list.Count, Is.EqualTo(0));
            });

        }

        [Test]
        public void SetSubject()
        {
            tetromino1.setSubject(subject);
            Subject sub = tetromino1.getSubject();
            Subject fakeSubject = new ConcreteSubject(new TetrisEngine());
            Assert.Multiple(() =>
            {
                Assert.That(sub, Is.EqualTo(subject));
                Assert.That(sub, Is.Not.EqualTo(fakeSubject));
            });

        }


        [Test]
        public void Action()
        {
            tetromino1.setStrategy(new RotationDown(_abstractFactory, tetromino1, _representation));
            tetromino1.action();
            Subject subject1 = tetromino1.getSubject();
            subject.subscribe(tetromino2);
            tetromino2.setStrategy(new RotationDown(_abstractFactory, tetromino2, _representation));
            tetromino2.action();
            Subject subject2 = tetromino2.getSubject();

            Assert.Multiple(() =>
            {
                Assert.That(subject1, Is.EqualTo(subject2));
            });

        }

    }
}
