--
--
--
-----------------
-- Exercise 7.15.
-----------------
--
--
--
module E'7'15 where



import E'7'12 ( iSort )

import Test.QuickCheck




-- If we sort the same set of 'objects in any order', the result should always be the same sorted set.
-- Especially an already sorted sets' elements should preserve their order when sorted again.


prop_iSort_idempotency :: [Integer] -> Bool
prop_iSort_idempotency integerList

 =  sortedIntegerList == iSort sortedIntegerList
 
 where
 
 sortedIntegerList :: [Integer]
 sortedIntegerList =  iSort integerList


-- GHCi> quickCheck prop_iSort_idempotency




