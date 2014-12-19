--
--
--
-----------------
-- Exercise 7.11.
-----------------
--
--
--
module E'7'11 where



import Prelude hiding ( reverse , unzip )

import qualified GHC.List ( reverse , unzip )

import Test.QuickCheck




reverse :: [a] -> [a]
reverse [] = []
reverse (item : remainingItems)

 =  (reverse remainingItems) ++ [item]
 

prop_reverse :: [Integer] -> Bool
prop_reverse integerList

 =  reverse integerList == GHC.List.reverse integerList


-- GHCi> quickCheck prop_reverse



unzip :: [(a, b)] -> ([a], [b])
unzip [] = ([], [])
unzip ((leftItem, rightItem) : remainingItems)

 =  (leftItem : remainingLeftItems, rightItem : remainingRightItems)
 
 where
 
 -- (remainingLeftItems, remainingRightItems) :: ([a], [b])
    (remainingLeftItems, remainingRightItems) =  unzip remainingItems


prop_unzip :: [(Integer, Integer)] -> Bool
prop_unzip integerPairs

 =  unzip integerPairs == GHC.List.unzip integerPairs


-- GHCi> quickCheck prop_unzip



-- Other solution for "unzip":


unzip' :: [(a, b)] -> ([a] , [b])
unzip' [] = ([] , [])
unzip' ((leftItem , rightItem) : remainingItems)

 =  let (remainingLeftItems , remainingRightItems) = (unzip' remainingItems)
    in  (leftItem : remainingLeftItems , rightItem : remainingRightItems)
	
	-- Expressions with "let" and "in" like this one are popular, especially in university exams.


prop_unzip' :: [(Integer, Integer)] -> Bool
prop_unzip' integerPairs

 =  unzip' integerPairs == GHC.List.unzip integerPairs


-- GHCi> quickCheck prop_unzip'




{- GHCi>

quickCheck prop_reverse
quickCheck prop_unzip
quickCheck prop_unzip'

-}




