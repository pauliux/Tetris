
using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Facade
{
    public class Facade
    {
        protected Bombs Bombs;
        protected Representation Representation;
        protected TetrominoFigure Tetromino;

        public Facade(Representation representation)
        {
            this.Representation = representation;
        }
        public Facade(Bombs bombs)
        {
            this.Bombs = bombs;
        }
        public Bombs GetBomb()
        {
            return Bombs;
        }
        public Representation GetRepresentation()
        {
            return Representation;
        }
        public void PutTetromino(TetrominoFigure tetromino)
        {
            Representation.PutTetrominoInBoard(tetromino);
        }
        public string EnableBombPic()
        {
            return Bombs.GetImageEnabled();
        }

        public string DisableBombPic()
        {
            return Bombs.GetImageDisabled();
        }
    }
}
