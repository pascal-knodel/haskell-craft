-- List (of integers) sum.
module Sum where



import Prelude hiding (sum)



sum :: [Integer] -> Integer
sum [] = 0
sum (integer : remainingIntegers)

 = integer + sum remainingIntegers



{- GHCi>


sum []
sum [1]
sum [1, 1]


-}
-- 0
-- 1
-- 2


