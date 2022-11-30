﻿using System;
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
        [TestCase(5)]
        [TestCase(10)]
        public void CheckIfAdapterGivesDiffrentBombEffectLines(int level1)
        {
            Target angelBomb = new Adapter("angel", level1);
            Target devilBomb = new Adapter("devil", level1);
            Assert.AreNotEqual(angelBomb.GetInformationLinesToChange(), devilBomb.GetInformationLinesToChange());
        }

        [TestCase(5)]
        [TestCase(10)]
        public void CheckIfAdapterGivesDiffrentBombEffectScore(int level1)
        {
            Target angelBomb = new Adapter("angel", level1);
            Target devilBomb = new Adapter("devil", level1);
            Assert.AreNotEqual(angelBomb.GetInformationCurrentScore(), devilBomb.GetInformationCurrentScore());
        }
        [TestCase(6,6)]
        [TestCase(10, 10)]
        public void CheckIfLevelHasEffectOnScoreAngelSame(int level1,int level2)
        {
            Target angelBomb1 = new Adapter("angel", level1);
            Target angelBomb2 = new Adapter("angel", level2);
            Assert.AreEqual(angelBomb1.GetInformationCurrentScore(), angelBomb2.GetInformationCurrentScore());
        }
        [TestCase(5)]
        [TestCase(10)]
        public void CheckIfLevelHasEffectOnScoreDevilSame(int level1)
        {
            Target devilBomb1 = new Adapter("devil", level1);
            Target devilBomb2 = new Adapter("devil", level1);
            Assert.AreEqual(devilBomb1.GetInformationCurrentScore(), devilBomb2.GetInformationCurrentScore());
        }
        [TestCase(1, 10)]
        [TestCase(2, 20)]
        public void CheckIfLevelHasEffectOnScoreAngelDiffrent(int level1,int level2)
        {
            Target angelBomb1 = new Adapter("angel", level1);
            Target angelBomb2 = new Adapter("angel", level2);
            Assert.AreNotEqual(angelBomb1.GetInformationCurrentScore(), angelBomb2.GetInformationCurrentScore());
        }

        [Test]
        public void CheckIfLevelHasEffectOnScoreDevilDiffrent()
        {
            Target devilBomb1 = new Adapter("devil", 10);
            Target devilBomb2 = new Adapter("devil", 1);
            Assert.AreNotEqual(devilBomb1.GetInformationCurrentScore(), devilBomb2.GetInformationCurrentScore());
        }

        [Test]
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
