module ItemsEqual where



import qualified Data.List ( isPrefixOf )




-- Exercise:
--
-- (  i.) Write a primitive recursive function that indicates if all items in a list are equal to a given reference item.
--      
--        Constraint: (!) The function that uses primitive recursion has to be conform to this pattern:
--      
--        ...                    -- Other definition(s).
--
--        f :: ...               -- Type signature.
--        f    ... = ...         -- Condition for termination.
--        f    ... = ... (f ...) -- Primitive recursion.
--
--        No more matchings for f than the one for termination listed above!
--       
--        Choose a descriptive name for your function f and complete the definitions where the dots are.
--        What could you do in the case of an empty list? Do something.
--
--        Hints: ItemsEqual.txt
--
-- ( ii.) Copy only the constricted primitive recursive function definition (your f) and paste it below. 
--        Change it to work correctly again by extending its pattern with additional conditions (f ... = ...).
--
--
-- Bonus:
--
-- (iii.) Find another definition using the function "Data.List.isPrefixOf" and a list comprehension
--        instead of primitive recursion.
--        
--        Insert "import qualified Data.List ( isPrefixOf )" after  "module ... where" to be able to use 
--        "Data.List.isPrefixOf" in your script without complications. If you leave out the "qualified"
--        you don't need the "Data.List." before "isPrefixOf".
--
--        Hints: ItemsEqual.txt



-- Possible solutions:



-- i.



areEqual :: Eq t => t -> [t] -> Bool
areEqual referenceItem [  ] =  error "No items."   -- Alternatives: "False" or "True".
areEqual referenceItem list

 =  areEqual_ ( referenceItem : list )
  
 where   -- f =

 areEqual_ :: Eq t => [t] -> Bool
 areEqual_ [                               singleListItem ] =  True
 areEqual_ ( listItem : nextListItem : remainingListItems )
  
  =  listItem == nextListItem  &&  areEqual_ ( nextListItem : remainingListItems )


{- GHCi>

areEqual 0 [      ]
areEqual 0 [    0 ]
areEqual 0 [    1 ]
areEqual 0 [ 0, 0 ]
areEqual 0 [ 0, 1 ]

-}
-- *** Exception: No items.
-- True
-- False
-- True
-- False




-- ii.



areEqual' :: Eq t => t -> [t] -> Bool
areEqual' _    [                               ] =  error "No items."   -- Alternatives: "False" or "True".
areEqual' item [                singleListItem ] =  item == singleListItem
areEqual' item ( listItem : remainingListItems )

 =  item == listItem  &&  areEqual' item remainingListItems


{- GHCi>

areEqual' 0 [      ]
areEqual' 0 [    0 ]
areEqual' 0 [    1 ]
areEqual' 0 [ 0, 0 ]
areEqual' 0 [ 0, 1 ]

-}
-- *** Exception: No items.
-- True
-- False
-- True
-- False



-- iii.



areEqual'' :: Eq t => [t] -> Bool
areEqual'' [                               ] =  error "No items."
areEqual'' ( listItem : remainingListItems )

 =  Data.List.isPrefixOf remainingListItems ( repeat listItem )   -- Alternative: [ listItem | _ <- [ 1, 1 .. ] ]


{- GHCi>

areEqual'' 0 [      ]
areEqual'' 0 [    0 ]
areEqual'' 0 [    1 ]
areEqual'' 0 [ 0, 0 ]
areEqual'' 0 [ 0, 1 ]

-}
-- *** Exception: No items.
-- True
-- False
-- True
-- False




