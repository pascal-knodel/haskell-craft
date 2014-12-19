-- Binomial coefficient. General Recursion.
module BinomialCoefficient where



bc :: Integer -> Integer -> Integer
bc _ 0 =  1
-- bc n 1 =  n   -- There would be an attempt to match this in every recursion step.
                 -- Under what condition(s) could this mathching be an advantage?
			     -- Under what condition(s) could this matching be a disadvantage?
				 -- (Keywords: recursion pattern, parallelism, complex data structures ...)
bc n k

 |  n == k     =  1
 |  otherwise  =     bc (n - 1) (k - 1)
                  +  bc (n - 1)  k


{- GHCi>

bc 1 0
bc 2 1
bc 2 2
bc 4 2

-}
-- 1
-- 2
-- 1
-- 6




