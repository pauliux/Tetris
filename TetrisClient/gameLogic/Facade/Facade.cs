using TetrisClient.gameLogic.Bomb;
using TetrisClient.gameLogic.Tetromino;

namespace TetrisClient.gameLogic.Facade
{
    public class Facade
    {
        protected Bombs bombs;
        protected Representation representation;
        protected TetrisClient.gameLogic.Tetromino.Tetromino Tetromino;

        public Facade(Representation representation)
        {
            this.representation = representation;
        }
        public Facade(Bombs bombs)
        {
            this.bombs = bombs;
        }
        public void PutTetromino(Tetromino.Tetromino Tetromino)
        {
            representation.PutTetrominoInBoard(Tetromino);
        }
        public string EnableBombPic()
        {
            return bombs.GetImageEnabled();
        }

        public string DisableBombPic()
        {
            return bombs.GetImageDisabled();
        }
    }
}
