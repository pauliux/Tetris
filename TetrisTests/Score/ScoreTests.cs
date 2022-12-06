
using TetrisClient;

namespace TetrisTests.Observers
{
    class ScoreTests
    {
        [Test]
        public void scoreHandleScoreTestingZero()
        {
            Score score = new Score();
            score.HandleScore(0);
            Assert.AreEqual(0, score.Rows);

        }
        [TestCase(2,3)]
        [TestCase(4, 6)]
        public void scoreHandleScoreTesting(int rows1, int rows2)
        {
            Score score = new Score();
            score.HandleScore(rows1);
            score.HandleScore(rows2);
            Assert.AreEqual(rows1+rows2, score.Rows);

        }
        [TestCase(4, 6)]
        public void scoreHandleLevelTesting1(int rows1, int rows2)
        {
            Score score = new Score();
            score.HandleScore(rows1);
            score.HandleScore(rows2);
            score.HandleLevel();
            Assert.AreEqual(2, score.Level);

        }
        [TestCase(4, 6)]
        public void scoreHandleLevelTesting2(int rows1, int rows2)
        {
            Score score = new Score();
            score.ForceLevelUpdate = true;
            score.HandleScore(rows1);
            score.HandleLevel();
            Assert.AreEqual(false, score.ForceLevelUpdate);

        }
    }
}
