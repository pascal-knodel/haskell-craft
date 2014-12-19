--
--
--
-----------------
-- Exercise 4.14.
-----------------
--
--
--
module E'4'14 where



import B'C'4
 (
   Move ( Rock , Paper , Scissors )
 )

import E'4'11 ( Result ( Win , Lose , Draw ) )
import E'4'12 ( outcome )

import Test.QuickCheck hiding ( Result )
import Test.QuickCheck ( quickCheck )




prop_outcome :: Bool
prop_outcome

 =      ( outcome Rock     Rock     ) == Draw
    &&  ( outcome Rock     Paper    ) == Lose
    &&  ( outcome Rock     Scissors ) == Win
 
    &&  ( outcome Paper    Paper    ) == Draw
    &&  ( outcome Paper    Rock     ) == Win
    &&  ( outcome Paper    Scissors ) == Lose
 
    &&  ( outcome Scissors Scissors ) == Draw
    &&  ( outcome Scissors Rock     ) == Lose
    &&  ( outcome Scissors Paper    ) == Win

-- GHCi> quickCheck prop_outcome



-- Note: This test data is quite manageable manually (3 * 3 test cases), 
--       BUT in general we should write smarter tests and/or generate most
--       of it dynamically.




