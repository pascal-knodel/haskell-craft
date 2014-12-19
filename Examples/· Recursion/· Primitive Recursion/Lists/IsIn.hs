-- Check if an item is in a list. Common names of this function: contains, elem, elemOf, member, isIn ...
module IsIn where



isIn :: (Eq t) => t -> [t] -> Bool
isIn _ [] = False
isIn referenceItem (listItem : remainingList)

 =  referenceItem == listItem || isIn referenceItem remainingList



{- GHCi>


isIn 'l' ""
isIn 'l' "list"
isIn 'i' "list" 
isIn 's' "list" 
isIn 't' "list" 
isIn ' ' "list" 


-}
-- False
-- True
-- True
-- True
-- True
-- False




