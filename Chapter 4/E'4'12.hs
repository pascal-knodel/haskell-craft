--
--
--
-----------------
-- Exercise 4.12.
-----------------
--
--
--
module E'4'12 where



import B'C'4
 (
   Move ( Rock , Paper , Scissors )
 , beat
 , lose
 )

import E'4'11 ( Result ( Win , Lose , Draw ) )

import Test.QuickCheck hiding ( Result )




outcome :: Move -> Move -> Result
outcome firstPlayerMove secondPlayerMove

 |  firstPlayerMove == ( beat secondPlayerMove )  = Win
 |  firstPlayerMove == ( lose secondPlayerMove )  = Lose
 |                                     otherwise  = Draw   -- |  firstPlayerMove == secondPlayerMove =  Draw




