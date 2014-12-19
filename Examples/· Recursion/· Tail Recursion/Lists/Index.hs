-- Search a list for an item and return its index.
module Index where



index :: (Eq t) => t -> [t] -> Integer
index referenceItem list

 = index' referenceItem list True (indexingStart - 1)
 
 where
 
 indexingStart :: Integer
 indexingStart = 0
 
 index' :: (Eq t) => t -> [t] -> Bool -> Integer -> Integer
 index' _ _ False indexAccumulator =  indexAccumulator
 index' _ [] _ _ =  -1
 index' referenceItem (listItem : remainingListItems) True indexAccumulator
 
  =  index' referenceItem remainingListItems indexIndicator $! (indexAccumulator + 1)
  
  where
  
  indexIndicator :: Bool
  indexIndicator
  
   | referenceItem /= listItem = True    -- Recursion.
   | otherwise                 = False   -- Termination.



{-

index '0' ""
index '1' "12"
index '2' "12"
index '3' "12"

-}
-- -1
--  0
--  1
-- -1




