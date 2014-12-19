--
--
--
------------------
-- Exercise 11.22.
------------------
--
--
--
module E'11'22 where



-- mapFuns :: [a -> b] -> a -> [b]
-- mapFuns functions argument
--
--  =  map (\function -> function argument) functions



-- My first step:

mapFuns'1 :: [a -> b] -> a -> [b]
mapFuns'1 functions

 =  \argument -> ( ($ argument) `map` functions )


-- My second (final) step:

mapFuns' :: [a -> b] -> a -> [b]
mapFuns' =  flip (  \argument -> ( ($ argument) `map` )  )


{- GHCi>

mapFuns' [(+1)] 0

-}
-- [1]




-- Other solutions for "mapFuns":



mapFuns'' :: [a -> b] -> a -> [b]
mapFuns''

 =  \functions argument -> ($ argument) `map` functions



mapFuns'3 :: [a -> b] -> a -> [b]
mapFuns'3 functions

 =  \argument -> ($ argument) `map` functions



mapFuns'4 :: [a -> b] -> a -> [b]
mapFuns'4 
 
 =  \functions argument -> zipWith ($) functions $ repeat argument



mapFuns'5 :: [a -> b] -> a -> [b]
mapFuns'5 functions

 =  \argument -> (flip map) functions ($ argument)



mapFuns'6 :: [a -> b] -> a -> [b]
mapFuns'6

 =  \functions argument -> (\function -> function argument) `map` functions



-- mapFuns'7 :: a -> [a -> b] -> [b]
-- mapFuns'7 argument
--
-- =  ( ($ argument) `map` )




