--
--
--
-----------------
-- Exercise 4.31.
-----------------
--
--
--
module E'4'31 where



import Prelude hiding ( gcd )




gcd :: Integer -> Integer -> Integer
gcd a b

   -- Euclid's algorithm:
   
 |     b == 0  = a
 
 |  otherwise  = gcd b (a `mod` b)




