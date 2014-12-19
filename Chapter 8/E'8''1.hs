--
--
--
----------------
-- Exercise 8.1.
----------------
--
--
--
module E'8''1 where



-- Note: Chapter 4> cabal install

import B'C'4
 (
   Move ( Rock , Paper , Scissors )
 )
import E'4'11
 (
   Result ( Win , Lose , Draw )
 )
import qualified E'4'12 ( outcome )




outcome :: Move -> Move -> Integer
outcome firstPlayerMove secondPlayerMove

 =  case (E'4'12.outcome firstPlayerMove secondPlayerMove) of
   
     Win  ->  1
     Draw ->  0
     Lose -> -1




