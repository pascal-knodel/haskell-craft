-- List minimum.
module Minimum where



import Prelude hiding (minimum)



minimum :: (Ord t, Eq t) => [t] -> t
minimum [] = error "Empty list."
minimum [item] = item
minimum (listItem : remainingListItems)

 = listItem `min` (minimum remainingListItems)



{- GHCi>


minimum []
minimum [0]
minimum [0, 1]


-}
-- *** Exception: Empty list.
-- 0
-- 0


