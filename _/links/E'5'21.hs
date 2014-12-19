--
--
--
-----------------
-- Exercise 5.21.
-----------------
--
--
--
module E'5'21 where



import Prelude hiding ( elem )




matches :: Integer -> [Integer] -> [Integer]
matches n xs

 =  [ x | x <- xs , n == x ]


{- GHCi>

matches 1 [ 0 , 1 , 0 , 1 ]

-}
-- [ 1 , 1 ]


elem :: Integer -> [Integer] -> Bool
elem n xs

 |  (matches n xs) /= []  = True
 |  otherwise             = False


{- GHCi>

0 `elem` [ 1 , 2 ]
1 `elem` [ 1 , 2 ]
0 `elem` [ 1 , 2 .. ]   -- Warning: endless function.
1 `elem` [ 1 , 2 .. ]

-}
-- False
-- True
--
-- True




