using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Iterator
{
    public class ConcreteAggregate : Aggregate
    {
        List<object> items = new List<object>();

        public void RoatationSet()
        {
            List<object> itemsRoatation = new List<object>();
            itemsRoatation.Add(0);
            itemsRoatation.Add(1);
            itemsRoatation.Add(-1);
            itemsRoatation.Add(2);
            itemsRoatation.Add(-2);
            items = itemsRoatation;

        }
        public override Iterator CreateIterator()
        {
            return new ConcreteIterator(this);
        }
        // Get item count
        public int Count
        {
            get { return items.Count; }
        }
        // Indexer
        public object this[int index]
        {
            get { return items[index]; }
            set { items.Insert(index, value); }
        }
    }
}
