-- Concatenate all lists in a list.
module Concat where



import Prelude hiding (concat)



concat :: [[t]] -> [t]
concat [] = []
concat (list : remainingLists)

 = list ++ concat remainingLists



{- GHCi>


concat [""]
concat ["con", "cat"]


-}
-- ""
-- "concat"


