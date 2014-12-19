-- Drop a number of items from the beginning of a list.
module Drop where



import Prelude hiding (drop)




drop :: Integer -> [t] -> [t]
drop _ [] =  []
drop numberOfItems list

 |  numberOfItems < 0  = error "Negative number."
 |  otherwise          = drop' numberOfItems list
 
 where -- Tail recursion:
 
 drop' 0 list = list
 drop' numberOfItems (listItem : remainingItems)
 
  =  drop' (numberOfItems - 1) remainingItems



{- GHCi>

drop   1  []
drop   0  [1]
drop   1  [1]
drop (-1) [1]
drop   1  [1, 2]
drop   2  [1, 2]
drop   2  [1, 2, 3]

-}
-- []
-- [1]
-- []
-- *** Exception: Negative number
-- [2]
-- []
-- [3]




