--
--
--
-----------------
-- Exercise 7.25.
-----------------
--
--
--
module E'7'25 where



import GHC.List ( elem )
import Data.List ( elemIndex )




isSublist :: (Eq a) => [a] -> [a] -> Bool
isSublist potentialSublist list

 =  successiveSearch potentialSublist list

 where
 
 successiveSearch [] _  = True
 successiveSearch _  [] = False
 successiveSearch potentialSublist@( potentialSublistItem : remainingPotentialSublistItems )
                                   ( listItem             : remainingListItems             )
              -- "potentialSublist" is an alias for "( potentialSublistItem : remainingPotentialSublistItems )".
 
  |  potentialSublistItem /= listItem  = isSublist potentialSublist               remainingListItems
                                               -- "potentialSublist" is the argument from "successiveSearches" (local definition).
  |  otherwise                         = isSublist remainingPotentialSublistItems remainingListItems


{- GHCi>

isSublist "12" "12"   -- Successive items.
isSublist "12" "-1-2" --      "       "  .

-}
-- True
-- True



isSubsequence :: (Eq a) => [a] -> [a] -> Bool
isSubsequence potentialSubsequence list

 =  consecutiveSearch potentialSubsequence list
 
 where
 
 consecutiveSearch [] _  = True
 consecutiveSearch _  [] = False
 consecutiveSearch ( potentialSubsequenceItem : remainingPotentialSubsequenceItems ) 
                   ( listItem                 : remainingListItems                 )
  
  |  potentialSubsequenceItem /= listItem  = consecutiveSearch potentialSubsequence               remainingListItems
                                                           -- "potentialSubsequence" is the argument from "isSubsequences".
  |  otherwise                             = consecutiveSearch remainingPotentialSubsequenceItems remainingListItems


{- GHCi> 

isSubsequence "12" "12"   --    Successive items.    Consecutive items.
isSubsequence "12" "-1-2" --    Successive items. No       "       "  .

-}
-- True
-- False



-- Other solution for "isSublist":
-- Will be used in ex. 7.26 to check "isSublist" against this differing definition "isSublist'" ... 


isSublist' :: (Eq a) => [a] -> [a] -> Bool
isSublist' [] _ = True
isSublist' _ [] = False
isSublist' [potentialSublistItem] list = potentialSublistItem `elem` list
isSublist' ( potentialSublistItem : remainingPotentialSublistItems ) list

 =  isSublist' remainingPotentialSublistItems remainingListItems
 
 where
 
 remainingListItems =  drop' (position potentialSublistItem list) list


{- GHCi>

isSublist' "12" "12"   -- Successive items.
isSublist' "12" "-1-2" --      "       "  .

-}
-- True
-- True


position :: (Eq a) => a -> [a] -> Int
position item list

 = position' 1 item list
 
 where
 
 position' :: (Eq a) => Int -> a -> [a] -> Int
 position' accumulator _ [] = -1 -- If the list doesn't contain the item.
 position' accumulator item ( listItem : remainingListItems ) -- Linear search:
 
  |  item == listItem  = accumulator
  |  otherwise         = position' (accumulator + 1) item remainingListItems


{- GHCi>

position '1' "123456789"
position '9' "123456789"
position '0' "123456789"

-}
--  1
--  9
-- -1


position' :: (Eq a) => a -> [a] -> Int
position' item list

 =  case (item `elemIndex` list) of -- See basic Haskell libraries: "Data.Maybe".
   
    Nothing      -> -1        -- If the list doesn't contain the item.
    (Just index) -> index + 1 -- Position.


{- GHCi>

position' '1' "123456789"
position' '9' "123456789"
position' '0' "123456789"

-}
-- 1
-- 9
-- -1


drop' :: Int -> [a] -> [a]
drop' _ []   = []
drop' 0 list = list
drop' numberOfItems ( listItem : remainingListItems )

 |  numberOfItems > 0  = drop' (numberOfItems - 1) remainingListItems

drop' _ _ = []



-- Other solution for "isSubsequence":
-- because the earlier "isSubsequence" definition may be harder to read, this one might be preferable:


isSubsequence' :: (Eq a) => [a] -> [a] -> Bool
isSubsequence' [] _  = True
isSubsequence' _  [] = False
isSubsequence' potentialSubsequence sequence@( sequenceElement : remainingSequenceElements )
                                -- "sequence" is an alias for "( sequenceElement : remainingSequenceElements )".

 | isPrefix potentialSubsequence sequence =  True
 | otherwise                              =  isSubsequence' potentialSubsequence remainingSequenceElements
 
 where
 
 isPrefix [] _  = True
 isPrefix _  [] = False
 isPrefix potentialPrefix@( potentialPrefixItem : remainingPotentialPrefixItems )
                          ( sequenceItem        : remainingSequenceItems        ) -- Consecutive search:
  
  |  potentialPrefixItem == sequenceItem  = isPrefix remainingPotentialPrefixItems remainingSequenceItems
  |  otherwise                            = False




