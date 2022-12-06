
namespace TetrisClient
{
    public class Score
    {
        private const int NumOfRowsForLeveling = 4;

        public bool ForceLevelUpdate;
        public int Level;

        public int Points;

        //number of deleted rows
        public int Rows;

        /// <summary>
        /// used for level calculation
        /// if it reaches NumOfRowsForLeveling or higher the level is upped
        /// </summary>
        private int _rowsForLeveling;

        public Score()
        {
            Level = 1;
            Points = 0;
            Rows = 0;
            ForceLevelUpdate = false;
        }

        /// <summary>
        /// Calculates the score that needs to be added when <paramref name="rows"/> are deleted
        /// </summary>
        /// <param name="rows"></param>
        public void HandleScore(int rows)
        {
            if (rows == 0) return;

            var multiplier = rows switch
            {
                2 => 100,
                3 => 300,
                4 => 1200,
                _ => 40,
            };

            Points += Level * multiplier + multiplier;
            Rows += rows;
            _rowsForLeveling += rows;
        }

        /// <summary>
        /// Calculates if a level needs to be added (level will be upped by one every NumOfRowsForLeveling deleted rows)
        /// </summary>
        /// <returns>true if the level is upped else false</returns>
        public bool HandleLevel()
        {
            if (ForceLevelUpdate)
            {
                ForceLevelUpdate = false;
            }
            else if (_rowsForLeveling < NumOfRowsForLeveling) return false;

            _rowsForLeveling = 0;
            Level++;
            return true;
        }
    }
}