-- List sorted by insertion sort.
module InsertionSort where



-- Inserts an item into a list after the first list-item which is lesser or equal than it:
insert :: (Ord t, Eq t) => t -> [t] -> [t]
insert item [                                   ] = [item]
insert item (listItem : remainingListItems)
 
 | item < listItem = item     : (listItem : remainingListItems)
 | otherwise       = listItem : (item `insert` remainingListItems)



-- Sorting:
insertionSort :: (Ord t, Eq t) => [t] -> [t]
insertionSort [                             ] = []
insertionSort (listItem : remainingListItems)

 = listItem `insert` (insertionSort remainingListItems)



{- GHCi>


insertionSort []
insertionSort [1, 2]
insertionSort [2, 1]


-}
-- []
-- [1, 2]
-- [1, 2]


