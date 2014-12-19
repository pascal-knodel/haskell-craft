--
--
--
------------------
-- Exercise 10.13.
------------------
--
--
--
module E'10'13 where




sumSquares' :: Integer -> Integer
sumSquares' tillNaturalNumber       -- Beginning with 1.

 = foldr (+) 0 ( map square [ 1 .. tillNaturalNumber ] )
 
 where
 
 square :: Integer -> Integer
 square number = number * number




