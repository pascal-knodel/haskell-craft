--
--
--
-----------------
-- Exercise 7.14.
-----------------
--
--
--
module E'7'14 where



import E'7'12 ( ins , iSort )

import Test.QuickCheck




isSorted :: (Ord a) => [a] -> Bool -- Primitive recursion:
isSorted [] = True
isSorted [ _ ] = True
isSorted ( predecessorItem : successorItem : remainingItems )
 
 =  (predecessorItem <= successorItem) && ( isSorted (successorItem : remainingItems) )



-- QuickCheck tests for "iSort" and "ins" (ex. 7.12):


prop_iSort :: [Integer] -> Bool
prop_iSort integerList

 =  isSorted (iSort integerList)


prop_ins :: Integer -> [Integer] -> Property
prop_ins integer integerList

 =      isSorted (integerList)
    ==> isSorted (ins integer integerList)


{- GHCi>

quickCheck prop_iSort
quickCheck prop_ins

-}




