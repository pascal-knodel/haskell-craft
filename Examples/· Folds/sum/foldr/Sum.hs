-- Cummulative sum. Primitive recursion with "foldr".
module Sum where



import Prelude hiding (sum)

import Data.List (foldr)




sum :: [Integer] -> Integer
sum =  foldr (+) 0


{- GHCi>

sum []
sum [1]
sum [1 , 2]

-}
-- 0
-- 1
-- 3




