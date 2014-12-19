--
--
--
-----------------
-- Exercise 11.9.
-----------------
--
--
--
module E'11''9 where



-- Exercise text 11.9 ...


f :: a -> b -> c
f firstArgument secondArgument =  undefined


-- ...



f' :: b -> a -> c
f' =  \secondArgument firstArgument -> f firstArgument secondArgument




