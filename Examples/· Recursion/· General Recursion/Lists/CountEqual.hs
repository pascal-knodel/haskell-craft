module CountEqual where



countEqual :: (Eq t) => t -> [t] -> Integer
countEqual _             [                             ] = 0
countEqual referenceItem (listItem : remainingListItems)

 |  (listItem /= referenceItem)  =     countEqual referenceItem remainingListItems
 |  otherwise                    = 1 + countEqual referenceItem remainingListItems



{- GHCi>

countEqual '0' "0.0"

-}
-- 2


