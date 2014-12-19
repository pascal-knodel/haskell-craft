--
--
--
-----------------
-- Exercise 7.17.
-----------------
--
--
--
module E'7'17 where



-- Yes, it has to be changed both times, because the predicate "<=" is expressed 
-- directly in the definition (its hard coded/defined).



-- Ex. 7.16, iSort' (descending order):

isSorted' :: (Ord a) => [a] -> Bool -- Primitive recursion:
isSorted' [] = True
isSorted' [ _ ] = True
isSorted' ( predecessorItem : successorItem : remainingItems )
 
 =  (predecessorItem >= successorItem) && ( isSorted' (successorItem : remainingItems) ) -- "<=" becomes ">=".


-- Ex. 7.16, iSort'' (no duplicates):

isSorted'' :: (Ord a) => [a] -> Bool -- Primitive recursion:
isSorted'' [] = True
isSorted'' [ _ ] = True
isSorted'' ( predecessorItem : successorItem : remainingItems )
 
 =  (predecessorItem < successorItem) && (isSorted'' (successorItem : remainingItems)) -- "<=" becomes "<".



-- Spoiler: if you already knew about higher order functions, you might have used 
-- them to supply the predicate in the argument to "isSorted". For this definition 
-- the answer is 'No'.




