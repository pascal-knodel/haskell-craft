-- Cummulative product. Primitive recursion with "foldr".
module Product where



import Prelude hiding (product)

import Data.List (foldr)




product :: [Integer] -> Integer
product =  foldr (*) 1


{- GHCi>

product []
product [1]
product [1 , 2]

-}
-- 1
-- 1
-- 2




