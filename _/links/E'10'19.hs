--
--
--
------------------
-- Exercise 10.19.
------------------
--
--
--
module E'10'19 where



import E'10'18 ( filterFirst )

import Test.QuickCheck ( quickCheck )




-- "filterLast":
----------------


filterLast :: (a -> Bool) -> [a] -> [a]
filterLast predicate list = dropHeadWhen predicate ( filterLast' predicate list )
 
 where
 
 filterLast' _ [] = []
 filterLast' predicate ( item : remainingItems )

  =  item `shiftLeft` ( filterLast' predicate remainingItems )
 
 shiftLeft left [] = [ left ]
 shiftLeft left ( right : remainingRightItems )

  -- If a 'bad' item is in the list it occurs first as a right argument to this function -
  -- in every recursion step it is now swapped to the left until it is the head of the list.
  |  not ( predicate right ) =  right : left  : remainingRightItems
  |                otherwise =  left  : right : remainingRightItems
 
 dropHeadWhen predicate list@( head : tail )
 
  |  not ( predicate head ) = tail
  |               otherwise = list
  


{- GHCi>

:{
   let isZero :: Integer -> Bool ;
       isZero integer = integer == 0
:}

filterLast isZero [ 0 , 1 , 2 , 0 ]

-}
-- 



-- "filterLast" using "filterFirst":
------------------------------------


filterLast' :: (a -> Bool) -> [a] -> [a]
filterLast' predicate list

 = reverse ( filterFirst predicate ( reverse list ) )


{- GHCi>

:{
   let isZero :: Integer -> Bool ;
       isZero integer = integer == 0
:}

filterLast' isZero [ 0 , 1 , 2 , 0 ]

-}
-- [ 0 , 1 , 0 ]




-- Note: it is possible to prove by induction, that filterLast and filterLast' are equal.
--       Be aware, that there are two cases:
--
--        1. At least one bad item is in the list.
--        2. No bad item is in the list.




