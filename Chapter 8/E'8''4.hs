--
--
--
----------------
-- Exercise 8.4.
----------------
--
--
--
module E'8''4 where



import B'C'8 ( Strategy )

-- Note: Chapter 4> cabal install

import B'C'4   
 (
   Move ( Rock , Paper , Scissors )
 )

import System.IO.Unsafe
import Data.Time
import System.Locale




-- Chapter8.hs ...


randomStrategy :: Strategy
randomStrategy _ =  convertToMove $ randInt 3


randInt :: Integer -> Integer
randInt =  unsafePerformIO . randomInt 


convertToMove :: Integer -> Move
convertToMove 0 = Rock
convertToMove 1 = Paper
convertToMove 2 = Scissors


randomInt :: Integer -> IO Integer
randomInt n

 =  do time <- getCurrentTime
       return ( (`rem` n) $ read $ take 6 $ formatTime defaultTimeLocale "%q" time)


-- ...


counterUnexpected :: Move -> Move
counterUnexpected move   -- "move" stands for a Move of that a player thinks that his opponent won't use it in a game round.
                         -- If this assertion stays true, there is an advantage: he can't loose.

 =  case (move) of
 
    Rock     -> Scissors   -- Wins or draws in {Paper , Scissors} if Rock     is unexpected.
    Paper    -> Rock       -- Wins or draws in {Rock  , Scissors} if Paper    is unexpected.
    Scissors -> Paper      -- Wins or draws in {Rock  , Paper   } if Scissors is unexpected.


counterTwo :: Strategy
counterTwo moves@(latestMove : moveBeforeLatestMove : remainingMoves)
       -- "moves" is an alias for "(latestMove : nextToLatestMove : remainingMoves)".
       
 |      length moves < 2
    ||  latestMove /= moveBeforeLatestMove  = randomStrategy moves
 |  otherwise                               = counterUnexpected latestMove




