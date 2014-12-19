--
--
--
-----------------
-- Exercise 4.13.
-----------------
--
--
--
module E'4'13 where



import B'C'4
 (
   Move ( Rock , Paper , Scissors )
 , beat
 , lose
 )

import Test.QuickCheck




prop_beatLose :: Move -> Bool
prop_beatLose move

 =  beat (lose move) == move

-- GHCi> quickCheck prop_beatLose




