-- Power of two. Primitive Recursion.
module PowerOfTwo where



powerOfTwo :: Integer -> Integer
powerOfTwo exponent

 |  exponent < 0  = error "Negative exponent."
 |  otherwise     = powerOfTwo' exponent
 
 where
 
 powerOfTwo' :: Integer -> Integer
 powerOfTwo' 0 =  1
 -- powerOfTwo' 1 =  2   -- There would be an attempt to match this in every recursion step.
                         -- Under what condition(s) could this mathching be an advantage?
						 -- Under what condition(s) could this matching be a disadvantage?
						 -- (Keywords: recursion pattern, parallelism, complex data structures ...)
 powerOfTwo' exponent
 
  =  2 * powerOfTwo' (exponent - 1)


{- GHCi>

powerOfTwo 0
powerOfTwo 1
powerOfTwo 2

-}
-- 1
-- 2
-- 4




