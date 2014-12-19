-- Count how often an item occurs in a list.
module Count where



count :: (Eq t) => t -> [t] -> Integer
count _ [] = 0
count referenceItem (listItem : remainingListItems)

 = value + (count referenceItem remainingListItems)
 
 where
 
 value :: Integer
 value = case (referenceItem /= listItem) of
         
         True  -> 0
         False -> 1



{- GHCi>


count '0' ""
count '0' "0.00"
count '0' "1.11"


-}
-- 0
-- 3
-- 0


