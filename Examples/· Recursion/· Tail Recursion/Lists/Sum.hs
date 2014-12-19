-- Add up all integer items in a list.
module Sum where



import Prelude hiding (sum)



sum :: [Integer] -> Integer
sum integerList

 = sum' integerList 0
 
 where
 
 sum' :: [Integer] -> Integer -> Integer
 sum' [] sumAccumulator = sumAccumulator
 sum' (integer : remainingIntegers) sumAccumulator

  = sum' remainingIntegers $! (sumAccumulator + integer)



{- GHCi>


sum []
sum [1]
sum [1, 1]


-}
-- 0
-- 1
-- 2


