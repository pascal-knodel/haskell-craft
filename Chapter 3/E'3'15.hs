--
--
--
-----------------
-- Exercise 3.15.
-----------------
--
--
--
module E'3'15 where



import E'3'13 ( max, maxThree )
import E'3'14 ( min, minThree )

import Prelude hiding ( min , max )
import qualified Prelude ( min , max )

import Test.QuickCheck ( quickCheck , verboseCheck )




prop_maxThree :: Integer -> Integer -> Integer -> Bool
prop_maxThree a b c

 =      ( maxThree   a         a         a       ) == a
    &&  ( maxThree ( a + 1 )   a         a       ) == a + 1
    &&  ( maxThree   a       ( a + 1 )   a       ) == a + 1
    &&  ( maxThree   a         a       ( a + 1 ) ) == a + 1

-- GHCi> quickCheck prop_maxThree

-- Note: If this test fails on your implementation use "verboseCheck"
--       to get the test data that caused it.



prop_min :: Int -> Int -> Bool
prop_min a b

 =  ( min a b ) == ( Prelude.min a b )

-- GHCi> quickCheck prop_min




prop_minThree :: Int -> Int -> Int -> Bool
prop_minThree a b c

 =      ( minThree   a          a         a       ) == a
    &&  ( minThree ( a + 1 )    a         a       ) == a + 1
    &&  ( minThree   a        ( a + 1 )   a       ) == a + 1
    &&  ( minThree   a          a       ( a + 1 ) ) == a + 1

-- GHCi> quickCheck prop_minThree

-- Note: If this test fails on your implementation use "verboseCheck"
--       to get the test data that caused it.



prop_maxMinThree :: Integer -> Integer -> Integer -> Bool
prop_maxMinThree a b c

 =  maxThree a b c >= toInteger (
                                  minThree ( fromInteger a )
                                           ( fromInteger b )
                                           ( fromInteger c )
                                )

-- GHCi> quickCheck prop_maxMinThree




{- GHCi>

quickCheck prop_maxThree
quickCheck prop_min
quickCheck prop_minThree
quickCheck prop_maxMinThree

-}




