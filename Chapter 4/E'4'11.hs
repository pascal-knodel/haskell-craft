--
--
--
-----------------
-- Exercise 4.11.
-----------------
--
--
--
module E'4'11 where



-- import Test.QuickCheck hiding ( Result )
--
-- Avoids ambiguous occurrences of Result that would cause an exception
-- if QuickCheck is imported without care.




data Result

 =   Win
   | Lose
   | Draw
   
   deriving Eq



-- Make it possible to "show" a Result:

instance Show Result 

 where
         
 show Win  = "W"
 show Lose = "L"
 show Draw = "D"

-- Ignore this, for now.




