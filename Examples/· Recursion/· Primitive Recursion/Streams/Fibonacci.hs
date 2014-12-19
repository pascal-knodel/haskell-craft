-- Infinite fibonacci sequence.
module Fibonacci where




fib :: [Integer]
fib
 
 =  0 : 1 : fib' 0 1
 
 where
 
 fib' :: Integer -> Integer -> [Integer]
 fib' a b =  (a + b) : fib' b (a + b)


-- GHCi> fib
-- [0 , 1 , 1 , 2 , 3 , 5 , 8 , 13 , 21 , 34 , 55 , 89 , 144 , 233 , 377 , ...
--
-- Note: interrupted.




