using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TetrisClient;
using TetrisClient.gameLogic;
using TetrisClient.gameLogic.Adapter;

namespace TetrisTests.AdapterTest
{
    class AdapterTest
    {
        [Test]
        public void CheckIfAdapterGivesDiffrentBombEffectLines()
        {
            Target angelBomb = new Adapter("angel", 5);
            Target devilBomb = new Adapter("devil", 5);
            Assert.AreNotEqual(angelBomb.GetInformationLinesToChange(), devilBomb.GetInformationLinesToChange());
        }

        [Test]
        public void CheckIfAdapterGivesDiffrentBombEffectScore()
        {
            Target angelBomb = new Adapter("angel", 5);
            Target devilBomb = new Adapter("devil", 5);
            Assert.AreNotEqual(angelBomb.GetInformationCurrentScore(), devilBomb.GetInformationCurrentScore());
        }
        [Test]
        public void CheckIfLevelHasEffectOnScoreAngelSame()
        {
            Target angelBomb1 = new Adapter("angel", 6);
            Target angelBomb2 = new Adapter("angel", 6);
            Assert.AreEqual(angelBomb1.GetInformationCurrentScore(), angelBomb2.GetInformationCurrentScore());
        }
        [Test]
        public void CheckIfLevelHasEffectOnScoreDevilSame()
        {
            Target devilBomb1 = new Adapter("devil", 5);
            Target devilBomb2 = new Adapter("devil", 5);
            Assert.AreEqual(devilBomb1.GetInformationCurrentScore(), devilBomb2.GetInformationCurrentScore());
        }

        [Test]
        public void CheckIfLevelHasEffectOnScoreAngelDiffrent()
        {
            Target angelBomb1 = new Adapter("angel", 10);
            Target angelBomb2 = new Adapter("angel", 1);
            Assert.AreNotEqual(angelBomb1.GetInformationCurrentScore(), angelBomb2.GetInformationCurrentScore());
        }
        [Test]
        public void CheckIfLevelHasEffectOnScoreDevilDiffrent()
        {
            Target devilBomb1 = new Adapter("devil", 10);
            Target devilBomb2 = new Adapter("devil", 1);
            Assert.AreNotEqual(devilBomb1.GetInformationCurrentScore(), devilBomb2.GetInformationCurrentScore());
        }

        public void CheckIfLevelHasEffectOnEffectAngelSame()
        {
            Target angelBomb1 = new Adapter("angel", 6);
            Target angelBomb2 = new Adapter("angel", 6);
            Assert.AreEqual(angelBomb1.GetInformationLinesToChange(), angelBomb2.GetInformationLinesToChange());
        }
        [Test]
        public void CheckIfLevelHasEffectOnEffectDevilSame()
        {
            Target devilBomb1 = new Adapter("devil", 5);
            Target devilBomb2 = new Adapter("devil", 5);
            Assert.AreEqual(devilBomb1.GetInformationLinesToChange(), devilBomb2.GetInformationLinesToChange());
        }

        [Test]
        public void CheckIfLevelHasEffectOnEffectAngelDiffrent()
        {
            Target angelBomb1 = new Adapter("angel", 10);
            Target angelBomb2 = new Adapter("angel", 1);
            Assert.AreNotEqual(angelBomb1.GetInformationLinesToChange(), angelBomb2.GetInformationLinesToChange());
        }
        [Test]
        public void CheckIfLevelHasEffectOnEffectDevilDiffrent()
        {
            Target devilBomb1 = new Adapter("devil", 10);
            Target devilBomb2 = new Adapter("devil", 1);
            Assert.AreNotEqual(devilBomb1.GetInformationLinesToChange(), devilBomb2.GetInformationLinesToChange());
        }

        [Test]
        public void CheckIfThereIsWrongTypeSoreResult()
        {
            Target wrong = new Adapter("wrong", 10);
            Assert.AreEqual(wrong.GetInformationCurrentScore(), 0);
        }

        [Test]
        public void CheckIfThereIsWrongTypeEffectResult()
        {
            Target wrong = new Adapter("wrong", 10);
            Assert.AreEqual(wrong.GetInformationLinesToChange(), 0);
        }


    }
}
