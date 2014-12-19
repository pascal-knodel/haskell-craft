--
--
--
----------------
-- Exercise 7.3.
----------------
--
--
--
module E'7''3 where



firstIncremented' :: [Integer] -> Integer
firstIncremented' integers

 |  integers == []  = 0
 |  otherwise       = (head integers) + 1


firstTwoAdded' :: [Integer] -> Integer
firstTwoAdded' integers

 |  integers == []       = 0
 |  length integers < 2  = head integers
 |  otherwise            = head integers + head (tail integers)


{- GHCi>

firstIncremented' [ 1 ]
firstTwoAdded' [ 1 , 2 ]

-}
-- 2
-- 3




