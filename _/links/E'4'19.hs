--
--
--
-----------------
-- Exercise 4.19.
-----------------
--
--
--
module E'4'19 where




-- For a moment I didn't get the question ... --> It is simple:
-- define multiplication (*) with addition (+) recursively.
-- Think about how to write multiplication (... * ...) different, using addition (... + ... * ...).


multiply :: Integer -> Integer -> Integer
multiply a b

 |      a <  0
    ||  b <  0  =  error "At least one argument isn't a natural number."

 |      a == 0
    ||  b == 0  =  0

 |    otherwise =  b + multiply ( a - 1 ) b   -- 'Equivalent': | otherwise   =  a + multiply a ( b - 1 )


{- GHCi>

multiply ( - 1 ) 0
multiply     0   0
multiply     1   1
multiply     2   2
multiply     4   4

-}
-- *** Exception: At least one argument isn't a natural number.
-- 0
-- 1
-- 4
-- 16




