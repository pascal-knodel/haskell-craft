--
--
--
-----------------
-- Exercise 3.21.
-----------------
--
--
--
module E'3'21 where



import E'3'20 ( averageThree , howManyAboveAverage , solution1 , solution2 )

import Test.QuickCheck ( quickCheck )




prop_averageThree :: Integer -> Bool
prop_averageThree a

 =  ( averageThree a a a ) == fromIntegral a

-- GHCi> quickCheck prop_averageThree



prop_howManyAboveAverage :: (Float -> Float -> Float -> Float -> Integer) -> Integer -> Integer -> Integer -> Bool
prop_howManyAboveAverage solution a b c

 =      ( howManyAboveAverage solution a   a         a       ) == 0
    &&  ( howManyAboveAverage solution a   a       ( a + 1 ) ) == 1
    &&  ( howManyAboveAverage solution a ( a + 1 ) ( a + 2 ) ) == 1



prop_solution1 :: Integer -> Integer -> Integer -> Bool
prop_solution1 a b c

 =  prop_howManyAboveAverage solution1 a b c

-- GHCi> quickCheck prop_solution1



prop_solution2 :: Integer -> Integer -> Integer -> Bool
prop_solution2 a b c

 =  prop_howManyAboveAverage solution2 a b c

-- quickCheck prop_solution2



prop_solution1against2 :: Integer -> Integer -> Integer -> Bool
prop_solution1against2 a b c

 =  ( howManyAboveAverage solution1 a b c ) == ( howManyAboveAverage solution2 a b c )

-- GHCi> quickCheck prop_solution1against2




{- GHCi>

quickCheck prop_averageThree
quickCheck prop_solution1
quickCheck prop_solution2
quickCheck prop_solution1against2

-}




