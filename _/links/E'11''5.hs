--
--
--
-----------------
-- Exercise 11.5.
-----------------
--
--
--
module E'11''5 where



-- zipWith applies the application operator to each element in the first list "[ sum , product ]".
-- The arguments for each application are in the second list "[ [1, 2] , [3, 4] ]".
--
-- Each application result is an element in the resulting list of "zipWith".



{- GHCi>

zipWith ($) [ sum , product ] [ [1, 2] , [3, 4] ]

-}
-- [ 3 , 12 ]




