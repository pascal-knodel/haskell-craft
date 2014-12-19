--
--
--
-----------------
-- Exercise 7.20.
-----------------
--
--
--
module E'7'20 where



import Prelude hiding ( take , drop , splitAt )

import qualified GHC.List ( drop , splitAt )

import Test.QuickCheck




-- Subchapter 7.5 (exercise relevant definition):


take :: Int -> [a] -> [a]
take 0 _  = []
take _ [] = []
take numberOfItems ( item : remainingItems )

 |  numberOfItems > 0  = item : (take (numberOfItems - 1) remainingItems)

take _ _ = error "E'7'20.take: negative argument"


-- ...


drop :: Int -> [a] -> [a]
drop _ []   = []
drop 0 list = list
drop numberOfItems (listItem : remainingListItems)

 |  numberOfItems > 0  = drop (numberOfItems - 1) remainingListItems

drop _ _ = error "E'7'20.drop: negative argument."


{- GHCi>

drop (-1) []
drop (-1) [ 0 ]

-}
-- []
-- *** Exception: E'7'20.drop: negative argument.



prop_drop :: (Positive Int) -> [Int] -> Bool
prop_drop (Positive numberOfItems) intList

 =  drop numberOfItems intList == GHC.List.drop numberOfItems intList


-- GHCi> quickCheck prop_drop



{- GHCi>

GHC.List.splitAt 1 [1, 2]

-}
-- ( [1] , [2] )


splitAt :: Int -> [a] -> ([a], [a])
splitAt position list -- Split after position (element at position belongs to the first/left tuple component).

 =  ( take position list, drop position list )

 
prop_splitAt :: (Positive Int) -> [Int] -> Bool
prop_splitAt (Positive afterPosition) integerList

 =  splitAt afterPosition integerList == GHC.List.splitAt afterPosition integerList


-- GHCi> quickCheck prop_splitAt



{- GHCi>

quickCheck prop_drop
quickCheck prop_splitAt

-}




