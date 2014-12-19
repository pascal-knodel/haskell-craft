-- Reverse a list.
module Reverse where



import Prelude hiding (reverse)




reverse :: [t] -> [t]
reverse list

 =  reverse' list []
 
 where
 
 reverse' :: [t] -> [t] -> [t]
 reverse' [] listAccumulator =  listAccumulator
 reverse' (item : remainingItems) listAccumulator =  reverse' remainingItems $! (item : listAccumulator)



{- GHCi>

reverse []
reverse [1]
reverse [1, 2]

-}
-- []
-- [1]
-- [2, 1]




