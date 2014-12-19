--
-- Chapter 8, definitions from the book or definitions that will be reused a lot.
--
module B'C'8 where



import B'C'4
 (
   Move ( Rock , Paper , Scissors )
 )

import Data.Time
import System.Locale
import System.IO.Unsafe
import System.IO




-- Subchapter 8.1 ...


type Tournament =  ( [Move] , [Move] )


type Strategy =  [Move] -> Move



-- Subchapter 8.6. ...


step :: Strategy -> Strategy -> Tournament -> Tournament
step strategy_1 strategy_2 ( moves_1 , moves_2 )

 =  ( strategy_1 moves_2 : moves_1 , strategy_2 moves_1 : moves_2 )


 
-- Chapter8.hs, "randomInt", "randInt":


randomInt :: Integer -> IO Integer
randomInt n
 =  do time <- getCurrentTime
       return ( (`rem` n) $ read $ take 6 $ formatTime defaultTimeLocale "%q" time)


randInt :: Integer -> Integer
randInt = unsafePerformIO . randomInt 




