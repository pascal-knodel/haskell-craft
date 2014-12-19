--
--
--
----------------
-- Exercise 7.2.
----------------
--
--
--
module E'7''2 where



firstTwoAdded :: [Integer] -> Integer
firstTwoAdded [] = 0
firstTwoAdded [ firstInteger ] = firstInteger
firstTwoAdded ( firstInteger : secondInteger : _ )

 =  firstInteger + secondInteger


{- GHCi>

firstTwoAdded [ 1 , 2 ]

-}
-- 3




