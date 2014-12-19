--
--
--
-----------------
-- Exercise 4.39.
-----------------
--
--
--
module E'4'39 where



import E'4'34 ( allEqual )
import E'4'35 ( allDifferent )

import Test.QuickCheck ( quickCheck , verboseCheck )




-- Subchapter 3.2, Relational operators (example) ...


threeEqual :: Integer -> Integer -> Integer -> Bool
threeEqual m n p

 =      m == n
    &&  n == p


-- ...



prop_allEqual :: Integer -> Integer -> Integer -> Bool
prop_allEqual a b c

 =  (allEqual a b c) == threeEqual a b c

-- GHCi> quickCheck prop_allEqual



-- Test results:
--
-- > quickCheck prop_allEqual
-- +++ OK, passed 100 tests.
--
-- > quickCheck prop_allEqual
-- *** Failed! Falsifiable (after 4 tests):
-- 1
-- -3
-- -1




-- Exercise 3.9 (its solution) ...


threeDifferent :: Integer -> Integer -> Integer -> Bool
threeDifferent a b c

 =      a /= b
    &&  a /= c
    &&  b /= c


-- ...



prop_allDifferent :: Integer -> Integer -> Integer -> Bool
prop_allDifferent a b c

 =  (allDifferent a b c) == threeDifferent a b c

-- GHCi> quickCheck prop_allDifferent


-- Test results:
-- 
-- > quickCheck prop_allDifferent
-- *** Failed! Falsifiable (after 8 tests and 2 shrinks):
-- 4
-- 0
-- 4



-- prop_howManyAboveAverage
-- Exercise 3.21 (its solution).




