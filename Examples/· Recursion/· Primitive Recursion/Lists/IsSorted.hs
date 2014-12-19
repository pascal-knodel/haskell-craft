-- Check if a list is sorted.
module IsSorted where



isSorted :: ( Ord t ) => [t] -> Bool
isSorted [] = True
isSorted [ _ ] = True
isSorted ( predecessor : successor : remainingListItems )
 
 = predecessor <= successor && isSorted ( successor : remainingListItems )



{- GHCi>


isSorted []
isSorted [1]
isSorted [1, 1] -- Duplicates allowed ("<=").
isSorted [1, 2] -- Ascending order.
isSorted [2, 1]


-}
-- True
-- True
-- True
-- True
-- False


