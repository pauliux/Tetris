using System.Collections.Generic;
using System.Windows.Documents;
using TetrisClient.gameLogic.Adapter;
using TetrisClient.gameLogic.Factory;

namespace TetrisClient.gameLogic.Composite;

public class Composite : Unit
{
    private List<Unit> _children = new List<Unit>();

    public override void Add(Unit c)
    {
        _children.Add(c);
    }

    public override void Remove(Unit c)
    {
        _children.Remove(c);
    }

    public override void Execute(Representation representation)
    {
        foreach (var child in _children)
        {
            child.Execute(representation);
        }
    }

    public Composite(int level) : base(level)
    {
    }
}