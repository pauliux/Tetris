

namespace TetrisTests.Score
{
    class ScoreTests
    {
        [Test]
        public void ScoreHandleScoreTestingZero()
        {
            TetrisClient.gameLogic.Score score = new TetrisClient.gameLogic.Score();
            score.HandleScore(0);
            Assert.AreEqual(0, score.Rows);

        }
        [TestCase(2,3)]
        [TestCase(4, 6)]
        public void ScoreHandleScoreTesting(int rows1, int rows2)
        {
            TetrisClient.gameLogic.Score score = new TetrisClient.gameLogic.Score();
            score.HandleScore(rows1);
            score.HandleScore(rows2);
            Assert.AreEqual(rows1+rows2, score.Rows);

        }
        [TestCase(4, 6)]
        public void ScoreHandleLevelTesting1(int rows1, int rows2)
        {
            TetrisClient.gameLogic.Score score = new TetrisClient.gameLogic.Score();
            score.HandleScore(rows1);
            score.HandleScore(rows2);
            score.HandleLevel();
            Assert.AreEqual(2, score.Level);

        }
        [TestCase(4, 6)]
        public void ScoreHandleLevelTesting2(int rows1, int rows2)
        {
            TetrisClient.gameLogic.Score score = new TetrisClient.gameLogic.Score();
            score.ForceLevelUpdate = true;
            score.HandleScore(rows1);
            score.HandleLevel();
            Assert.AreEqual(false, score.ForceLevelUpdate);

        }
    }
}
