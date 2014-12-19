-- Filter. General Recursion.
module Filter where



import Prelude hiding (filter)




filter :: (a -> Bool) -> [a] -> [a]
filter _ [] =  []
filter predicate (item : remainingItems)

 =  filter' (predicate item) (item : remainingItems)
 
 where
 
 -- filter' :: Bool -> [a] -> [a]
 filter' _     []                      =  []
 filter' True  (item : remainingItems) =  item : filter' (predicate $ head remainingItems) remainingItems
 filter' False (item : remainingItems) =         filter' (predicate $ head remainingItems) remainingItems


{- GHCi>

filter (> 0) []
filter (> 0) [1]
filter (> 0) [1 , 2]

-}
-- []
-- [1]
-- [1 , 2]













-- TODO: attempt to define a append operation in reverse to ++, so that it is efficient, I mean O(length right) instead O(length left).



{-
-- Reverse List:
data RL =     RL0
           |  RLC (RL a) a
		   
		   deriving ( Eq , Ord , Show , Read )


appendRL :: RL a ->
-}



{-
filter :: (a -> Bool) -> [a] -> [a]
filter predicate list

 =  filter' [] list
 
 where
 
 filter' filterAccumulator [] =  filterAccumulator
 filter' filterAccumulator (i : is)
  
  =  filter' ( if (predicate i) then (filterAccumulator : i) else () ) 
-}


{- GHCi>





-}
-- 




