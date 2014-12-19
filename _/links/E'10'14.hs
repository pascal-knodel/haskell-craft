--
--
--
------------------
-- Exercise 10.14.
------------------
--
--
--
module E'10'14 where



squareSumPositives :: [Integer] -> Integer
squareSumPositives numbers

 = sum ( map square ( filter isPositive numbers ) )
 
 where
 
 isPositive :: Integer -> Bool
 isPositive number = number > 0
 
 square :: Integer -> Integer
 square number = number * number




