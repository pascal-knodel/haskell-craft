--
-- Chapter 11, definitions from the book.
--
module B'C'11 where



import Prelude hiding (succ)




-- Subchapter 11.1, forward composition ...


infixl 9 >.>
(>.>) :: (a -> b) -> (b -> c) -> (a -> c)
g >.> f =  f . g



-- Subchapter 11.2, "mapFuns":


mapFuns :: [a -> b] -> a -> [b]
mapFuns fs x =  map (\f -> f x) fs



-- Subchapter 11.2, "comp2":


comp2 :: (a -> b) -> (b -> b -> c) -> (a -> a -> c)
comp2 f g =  \x y -> g (f x) (f y)



-- Subchapter 11.4, "double":


double :: Integer -> Integer
double =  (* 2)



-- Subchapter 11.5 "iter", "succ":


iter :: Integer -> (a -> a) -> (a -> a)
iter n f
 |  n > 0      = f . iter (n - 1) f
 |  otherwise  = id


succ :: Integer -> Integer
succ n =  n + 1




