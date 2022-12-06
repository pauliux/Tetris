using System.Diagnostics;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Factory;
using TetrisClient.gameLogic.Level;
using TetrisClient.gameLogic.Observers;
using TetrisClient.gameLogic.Strategy;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisTests.Observer
{
    class ObserverTests
    {
        private Subject? _subject;
        private List<TetrisClient.gameLogic.Observers.Observer>? _expected;
        TetrominoFigure? _tetromino1;
        TetrominoFigure? _tetromino2;
        Representation? _representation;
        AbstractFactory? _abstractFactory;

        [SetUp]
        public void SetUp()
        {
            _subject = new ConcreteSubject(new TetrisEngine());
            _expected = new List<TetrisClient.gameLogic.Observers.Observer>();
            _representation = new Representation();
            Random random1 = new Random(20);
            Random random2 = new Random(20);
            Creator creator = new LevelCreator();
            Level level = creator.GetLevel(2);
            _abstractFactory = level.GetAbstractFactory();
            _tetromino1 = (TetrominoFigure)_abstractFactory.GetTetromino(4, 0, random1);
            _tetromino2 = (TetrominoFigure)_abstractFactory.GetTetromino(4, 0, random2);
            _subject.Subscribe(_tetromino1);
            _subject.Subscribe(_tetromino2);
            _expected.Add(_tetromino1);
            _expected.Add(_tetromino2);
        }

        [Test]
        public void Subscribe()
        {
            Debug.Assert(_subject != null, nameof(_subject) + " != null");
            Debug.Assert(_expected != null, nameof(_expected) + " != null");
            Assert.That(_subject.List.Count, Is.EqualTo(_expected.Count));
        }

        [Test]
        public void Unsubscribe()
        {
            Debug.Assert(_subject != null, nameof(_subject) + " != null");
            _subject.Unsubscribe(_tetromino1);
            _subject.Unsubscribe(_tetromino2);

            Assert.That(_subject.List.Count, Is.EqualTo(0));
        }

        [Test]
        public void SetSubject()
        {
            Debug.Assert(_tetromino1 != null, nameof(_tetromino1) + " != null");
            _tetromino1.SetSubject(_subject);
            Subject sub = _tetromino1.GetSubject();
            Subject fakeSubject = new ConcreteSubject(new TetrisEngine());
            Assert.Multiple(() =>
            {
                Assert.That(sub, Is.EqualTo(_subject));
                Assert.That(sub, Is.Not.EqualTo(fakeSubject));
            });

        }


        [Test]
        public void Action()
        {
            Debug.Assert(_tetromino1 != null, nameof(_tetromino1) + " != null");
            _tetromino1.SetStrategy(new RotationDown(_abstractFactory, _tetromino1, _representation));
            _tetromino1.Action();
            Subject subject1 = _tetromino1.GetSubject();
            Debug.Assert(_subject != null, nameof(_subject) + " != null");
            _subject.Subscribe(_tetromino2);
            Debug.Assert(_tetromino2 != null, nameof(_tetromino2) + " != null");
            _tetromino2.SetStrategy(new RotationDown(_abstractFactory, _tetromino2, _representation));
            _tetromino2.Action();
            Subject subject2 = _tetromino2.GetSubject();


            Assert.That(subject1, Is.EqualTo(subject2));

        }

    }
}
