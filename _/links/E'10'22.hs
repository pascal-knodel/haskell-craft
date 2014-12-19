--
--
--
------------------
-- Exercise 10.22.
------------------
--
-- 
--
module E'10'22 where



import E'10'21 ( split , merge )

import Test.QuickCheck

 (
   Property (..)
 , (==>)
 , quickCheck
 , verboseCheck
 )




-- 'merge ( split list ) = list':
---------------------------------


prop_mergeSplit :: [Integer] -> Bool
prop_mergeSplit list

 =  merge ( split list ) == list

-- GHCi> quickCheck prop_mergeSplit




-- 'split ( merge listTuple ) = listTuple':
-------------------------------------------


prop_splitMerge :: [Integer] -> [Integer] -> Property
prop_splitMerge list_1 list_2

 =       length list_1 == length list_2 + 1
 
    ==>  split ( merge (list_1 , list_2) ) == ( list_1 , list_2 )

-- GHCi> quickCheck prop_splitMerge

-- GHCi> verboseCheck prop_splitMerge




