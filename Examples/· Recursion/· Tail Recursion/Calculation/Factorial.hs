-- Factorial calculation.
module Factorial where



factorial :: Integer -> Integer
factorial factor 

 |  factor < 0  = error "Negative factor."
 |  otherwise   = factorial' factor 1
 
 where
 
 factorial' :: Integer -> Integer -> Integer
 factorial' 0 _ =  1
 factorial' 1 factorialAccumulator = factorialAccumulator
 factorial' factor factorialAccumulator = factorial' (factor - 1) $! (factor * factorialAccumulator)



{- GHCi>

factorial (-1)
factorial   0
factorial   1
factorial   2
factorial   3
factorial   4
factorial   5

-}
-- *** Exception: Negative factor.
--   1
--   1
--   2
--   6
--  24
-- 120




