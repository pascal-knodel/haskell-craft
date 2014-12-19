--
--
--
------------------
-- Exercise 10.10.
------------------
--
--
--
module E'10'10 where



import E'10''9 ( iter )

import Test.QuickCheck.Modifiers ( Positive(..) )
import Test.QuickCheck ( quickCheck )




power2 :: Integer -> Integer
power2 exponent

 | exponent < 0 = error "Negative exponent."
 | otherwise    = iter exponent double 1
 
 where
 
 double :: Integer -> Integer
 double integer = integer * 2



prop_power2 :: ( Positive Integer ) -> Bool
prop_power2 ( Positive integer )

 = power2 integer == 2 ^ integer


-- GHCi> quickCheck prop_power2




