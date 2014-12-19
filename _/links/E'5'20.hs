--
--
--
-----------------
-- Exercise 5.20.
-----------------
--
--
--
module E'5'20 where



divisors :: Integer -> [Integer]
divisors n

 =  [ x | x <- [1 .. n], n `mod` x == 0 ]


{- GHCi>

divisors 2
divisors 4

-}
-- [ 1 , 2 ]
-- [ 1 , 2 , 4 ]


isPrime :: Integer -> Bool
isPrime n

 |  [1, n] == divisors n  = True
 |  otherwise             = False


{- GHCi>

isPrime 2
isPrime 4

-}
-- True
-- False




