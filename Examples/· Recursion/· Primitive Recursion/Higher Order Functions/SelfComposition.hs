-- Self composition of an unary function. Primitive Recursion.
module SelfComposition where



selfCompose :: Integer -> (a -> a) -> (a -> a)
selfCompose 0     _        =  id
selfCompose times function

 =  function . selfCompose (times - 1) function


{- GHCi>

( selfCompose 0 (+ 1) ) 1
( selfCompose 1 (+ 1) ) 1
( selfCompose 2 (+ 1) ) 1

-}
-- 1
-- 2
-- 3




