--
--
--
-----------------
-- Exercise 4.32.
-----------------
--
--
--
module E'4'32 where



import Prelude hiding ( even )
import qualified Prelude ( even )

import Test.QuickCheck ( Positive (..) , quickCheck )




even :: Integer -> Bool
even n

 |  (n `mod` 2) == 0 =  True
 
 |           otherwise =  False



powerTwo :: Integer -> Integer
powerTwo n

 |     n < 0 =  error "Negative exponent."
 
 |    n == 0 =  1
 
 |    n == 1 =  2
 
 |    even n =     ( powerTwo (n `div` 2) )
                *  ( powerTwo (n `div` 2) )

   -- "odd":

 | otherwise =     (  powerTwo ( (n - 1) `div` 2 )  )
                *  (  powerTwo ( (n - 1) `div` 2 )  )
                *  2



prop_powerTwo :: Positive Integer -> Bool
prop_powerTwo ( Positive n )

 =  2^n == powerTwo n

-- GHCi> quickCheck prop_powerTwo    




-- Other solution ...


powerTwo2 :: Integer -> Integer
powerTwo2 n

 |          n <  0 =  error "Negative exponent."
 
 |          n == 0 =  1
 
 |          n == 1 =  2
 
 |  Prelude.even n =     ( powerTwo (n `div` 2) )
                      *  ( powerTwo (n `div` 2) )

   -- Otherwise:
   -- Prelude.odd n

 |      otherwise =     (  powerTwo ( (n - 1) `div` 2 )  )
                     *  (  powerTwo ( (n - 1) `div` 2 )  )
                     *  2




