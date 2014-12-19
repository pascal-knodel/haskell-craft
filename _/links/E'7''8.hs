--
--
--
----------------
-- Exercise 7.8.
----------------
--
--
--
module E'7''8 where



import Test.QuickCheck




elemNum :: Integer -> [Integer] -> Integer
elemNum _ [] = 0
elemNum referenceInteger (integer : remainingIntegers)

 |  integer /= referenceInteger  =     (elemNum referenceInteger remainingIntegers)
 |  otherwise                    = 1 + (elemNum referenceInteger remainingIntegers)


{- GHCi>

elemNum 1 []
elemNum 1 [ 0 , 0 , 0 ]
elemNum 1 [ 0 , 0 , 1 ]
elemNum 1 [ 0 , 1 , 0 ]
elemNum 1 [ 0 , 1 , 1 ]
elemNum 1 [ 1 , 0 , 0 ]
elemNum 1 [ 1 , 0 , 1 ]
elemNum 1 [ 1 , 1 , 0 ]
elemNum 1 [ 1 , 1 , 1 ]

-}
-- 0
-- 0
-- 1
-- 1
-- 2
-- 1
-- 2
-- 2
-- 3



elemNum' :: Integer -> [Integer] -> Integer
elemNum' referenceInteger integerList

 =  sum [ 1 | integer <- integerList , integer == referenceInteger ] 


prop_elemNum :: Integer -> [Integer] -> Bool
prop_elemNum integer integerList

 =  elemNum integer integerList == elemNum' integer integerList


{- GHCi>

quickCheck prop_elemNum

-}



-- Other solution for "elemNum":


elemNum'3 :: Integer -> [Integer] -> Integer
elemNum'3 referenceInteger integerList

 =  toInteger (length [ 1 | integer <- integerList , integer == referenceInteger ])


prop_elemNum'3 :: Integer -> [Integer] -> Bool
prop_elemNum'3 integer integerList

 =  elemNum integer integerList == elemNum'3 integer integerList


{- GHCi>

quickCheck prop_elemNum'3

-}




