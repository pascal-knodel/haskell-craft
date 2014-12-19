--
--
--
----------------
-- Exercise 4.1.
----------------
--
--
--
module E'4''1 where




maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c

 =  max (max a b) c


{- GHCi>

-- Three equal:

maxThree 0 0 0

-- Two equal:

maxThree 0 0 1
maxThree 0 1 0
maxThree 1 0 0

-- All different:

maxThree 0 1 2
maxThree 0 2 1
maxThree 1 0 2
maxThree 1 2 0
maxThree 2 0 1
maxThree 2 1 0

-}
-- 0
--
-- 1
-- 1
-- 1
--
-- 2
-- 2
-- 2
-- 2
-- 2
-- 2



maxFour1, maxFour2, maxFour3 :: Integer -> Integer -> Integer -> Integer -> Integer

maxFour1 a b c d

 |      a > b
    &&  a > c
    &&  a > d  = a
    
 |      b > c
    &&  b > d  = b
    
 |  c > d      = c
 
 | otherwise   = d


maxFour2 a b c d

 =  max ( max (max a b) c ) d


maxFour3 a b c d

 = max (maxThree a b c) d




