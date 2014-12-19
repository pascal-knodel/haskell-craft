--
--
--
-----------------
-- Exercise 11.8.
-----------------
--
--
--
module E'11''8 where



total :: (Integer -> Integer) -> (Integer -> Integer)
total function

 =  \n -> if (n < 0) then  error "E'11'8.hs, total: Negative value."
		             else  sum $ map function [0 .. n]


{- GHCi>

total id (-1)
total id 0
total id 1
total id 2
total id 3

-}
-- *** Exception: E'11'8.hs, total: Negative value.
-- 0
-- 1
-- 3
-- 6




-- Other solution for "total":



total' :: (Integer -> Integer) -> (Integer -> Integer)
total' function

 =  \n -> if (n < 0) then  error "E'11'8.hs, total: Negative value."
		             else  sum [ function value | value <- [ 0 .. n ] ]




