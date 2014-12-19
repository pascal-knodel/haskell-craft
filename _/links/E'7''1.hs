--
--
--
----------------
-- Exercise 7.1.
----------------
--
--
--
module E'7''1 where



firstIncremented :: [Integer] -> Integer
firstIncremented [] =  0
firstIncremented ( firstInteger : _ ) =  firstInteger + 1


{- GHCi>

firstIncremented [ 1 ]

-}
-- 2



-- Other solutions for "firstIncremented":


firstIncremented'3 :: [Integer] -> Integer
firstIncremented'3 [] =  0
firstIncremented'3 ( firstInteger : _ ) =  succ firstInteger


{- GHCi>

firstIncremented'3  [ 1 ]

-}
-- 2


-- See ex. 7.3.




