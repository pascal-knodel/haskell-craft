--
--
--
------------------
-- Exercise 11.13.
------------------
--
--
--
module E'11'13 where



mapFuns' :: [a -> b] -> a -> [b]
mapFuns' functionList input

 =  map ($ input) functionList   -- Note: Because "($)" is not associative, it is not possible
                                 --       to write "(input $)" instead of "($ input)".
								 --       ($) is right associative.


{- GHCi>

mapFuns' [ (+1) , (+2) ] 0

-}
-- [ 1 , 2 ]



-- Other solution for "mapFuns":


mapFuns'' :: [a -> b] -> a -> [b]
mapFuns'' functionList input

 =  ($ input) `map` functionList




