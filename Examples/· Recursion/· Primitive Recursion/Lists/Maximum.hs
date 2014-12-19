-- List maximum.
module Macimum where



import Prelude hiding (maximum)



maximum :: (Ord t, Eq t) => [t] -> t
maximum [] = error "Empty list."
maximum [item] = item
maximum (listItem : remainingListItems)

 = listItem `max` (maximum remainingListItems)



{- GHCi> 


maximum []
maximum [0]
maximum [0, 1]


-}
-- *** Exception: Empty list.
-- 0
-- 1


