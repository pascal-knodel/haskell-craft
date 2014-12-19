-- Factorial.
module Factorial where



factorial :: Integer -> Integer
factorial factor 

 |  factor < 0  = error "Negative factor."
 |  otherwise   = factorial' factor
 
 where
 
 factorial'  :: Integer -> Integer
 factorial' 0      =  1
 factorial' 1      =  1
 factorial' factor =  factor * factorial' (factor - 1)



{- GHCi>

factorial (-1)
factorial  0
factorial  1
factorial  2
factorial  3

-}
-- *** Exception: Negative factor.
-- 1
-- 1
-- 2
-- 6




