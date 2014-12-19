-- Nth item of a list.
module Th where



startIndex :: Integer
startIndex = 0



th :: Integer -> [t] -> t
th _ [] = error "Empty list."
th index list

 | index < startIndex = error ("Index lesser than " ++ (show startIndex) ++ ".")
 | otherwise          = th' index list

 where
 
 th' :: Integer -> [t] -> t
 th' _ [] = error "Index out of bounds."
 th' index (listItem : remainingListItems) 

  = if   (index /= startIndex)
    then (th' (index - 1) remainingListItems)
    else (listItem)



{- GHCi>


th   1 []
th (-1) [1]
th   0 [1]
th   1 [1]
th   1 [1, 2]
th   2 [1, 2]


-}
-- *** Exception: Empty list.
-- *** Exception: Index lesser than 0.
-- 1
-- *** Exception: Index out of bounds.
-- 2
-- *** Exception: Index out of bounds.


