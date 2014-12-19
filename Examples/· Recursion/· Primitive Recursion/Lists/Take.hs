-- Take a number of items from the beginning of a list.
module Take where



import Prelude hiding (take)



take :: Integer -> [t] -> [t]
take _ [] = []
take numberOfItems list

 | numberOfItems < 0 = error "Negative number."
 | otherwise         = take' numberOfItems list
 
 where
 
 take' 0 _ = []
 take' numberOfItems (listItem : remainingListItems)
 
  = listItem : (take' (numberOfItems - 1) remainingListItems)



{- GHCi>


take   1  []
take   0  [1]
take   1  [1]
take (-1) [1]
take   1  [1, 2]
take   2  [1, 2]
take   2  [1, 2, 3]


-}
-- []
-- []
-- [1]
-- *** Exception: Negative number.
-- [1]
-- [1, 2]
-- [1, 2]


