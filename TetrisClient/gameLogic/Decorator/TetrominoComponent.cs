using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TetrisClient.gameLogic.Decorator
{
    public abstract class TetrominoComponent
    {
        public abstract Dictionary<char, Matrix> getTetrominos();

        //    {'O',new Matrix(new[,] { { 1, 1 }, { 1, 1 } })}
        //    //{'T',new Matrix(new[,] { { 2, 2, 2 }, { 0, 2, 0 }, { 0, 0, 0 } })},
        //    //{'J',new Matrix(new[,] { { 0, 3, 0 }, { 0, 3, 0 }, { 3, 3, 0 } })},
        //    //{'L',new Matrix(new[,] { { 0, 4, 0 }, { 0, 4, 0 }, { 0, 4, 4 } })},
        //    //{'S',new Matrix(new[,] { { 0, 5, 5 }, { 5, 5, 0 }, { 0, 0, 0 } })},
        //    //{'Z',new Matrix(new[,] { { 6, 6, 0 }, { 0, 6, 6 }, { 0, 0, 0 } })},
        //    //{'I', new Matrix(new[,] { { 0, 0, 0, 0 }, { 7, 7, 7, 7 }, { 0, 0, 0, 0 }, { 0, 0, 0, 0 } })}
    }
}
