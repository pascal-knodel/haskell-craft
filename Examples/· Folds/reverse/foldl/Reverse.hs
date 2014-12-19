-- List reversion. Tail recursion with "foldl".
module Reverse where



import Prelude hiding (reverse)

import Data.List (foldl)




reverse :: [t] -> [t]
reverse =  foldl (\remainingItems item -> item : remainingItems) []


{- GHCi>

reverse ""
reverse "1"
reverse "12"

-}
-- ""
-- "1"
-- "21"




