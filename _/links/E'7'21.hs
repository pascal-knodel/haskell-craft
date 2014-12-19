--
--
--
-----------------
-- Exercise 7.21.
-----------------
--
--
--
module E'7'21 where



import qualified GHC.List ( take )

import Test.QuickCheck




take' :: Int -> [a] -> [a]
take' 0 _ = []
take' numberOfItems list

 | numberOfItems < 0 =  error "E'7'21.take': negative argument"
 | otherwise         =  case (list) of
   
                        [] -> []
                        ( listItem : remainingListItems ) -> listItem : (take' (numberOfItems - 1) remainingListItems)


{- GHCi>

take' (-1) []

-}
-- *** Exception: E'7'21.take': negative argument



prop_take' :: (Positive Int) -> [Int] -> Bool
prop_take' (Positive numberOfItems) intList

 =  take' numberOfItems intList == GHC.List.take numberOfItems intList


-- GHCi> quickCheck prop_take'




