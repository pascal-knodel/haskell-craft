-- Fibonacci number. Tail Recursion.
module Fibonacci where



fibonacci :: Integer -> Integer
fibonacci index
 
 |  index < 0  = error "Negative index."
 |  otherwise  = fibonacci' index 0 1
 
 where
 
 fibonacci' :: Integer -> Integer -> Integer -> Integer
 fibonacci' 0     _            _                 =  0            
 fibonacci' 1     _            numberAccumulator =  numberAccumulator
 fibonacci' index intermediate numberAccumulator
 
  =  fibonacci' (index - 1) numberAccumulator $! (numberAccumulator + intermediate)


{- GHCi>

fibonacci (-1)
fibonacci   0
fibonacci   1
fibonacci   2
fibonacci   3
fibonacci   4
fibonacci   5

-}
-- *** Exception: Negative index.
-- 0
-- 1
-- 2
-- 3
-- 5




