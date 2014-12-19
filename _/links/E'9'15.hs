--
--
--
-----------------
-- Exercise 9.15.
-----------------
--
--
--
module E'9'15 where



import E'9''1 ( fac  )
import E'9'13 ( facAux , fac2 )

import Test.QuickCheck

 (
   Property (..)
 , (==>)
 , Positive (..)
 , quickCheck
 , verboseCheck
 )




prop_FacFac2 :: Integer -> Bool
prop_FacFac2 integer

 =  fac integer == fac2 integer

-- GHCi> quickCheck prop_FacFac2
-- *** Failed! Exception: 'Negative factor.' (after 6 tests and 1 shrink):
-- -1


prop_FacFac2' :: Integer -> Property
prop_FacFac2' integer

 =      integer > -1
    ==> fac integer == fac2 integer

-- GHCi> quickCheck prop_FacFac2'
-- +++ OK, passed 100 tests.



-- Better solution:


prop_FacFac2'' :: (Positive Integer) -> Bool
prop_FacFac2'' ( Positive integer )

 =  fac integer == fac2 integer

-- GHCi> quickCheck prop_FacFac2''
-- +++ OK, passed 100 tests.



fac2' :: Integer -> Integer
fac2' n 

 | n < 0     = error "Negative factor."
 | otherwise = fac2'' n
 
 where
 
 fac2'' :: Integer -> Integer
 fac2'' n =  facAux n 1


{- GHCi>

fac2' ( -1 )
fac2'    0
fac2'    1
fac2'    2
fac2'    3
fac2'    4
fac2'    5

-}
-- *** Exception: Negative factor.
--   1
--   1
--   2
--   6
--  24
-- 120




