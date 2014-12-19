--
--
--
------------------
-- Exercise 11.11.
------------------
--
--
--
module E'11'11 where



import GHC.Enum ( enumFromTo )




-- "comp2":
-----------


comp2 :: (a -> b) -> (b -> b -> c) -> (a -> a -> c)
comp2 f g
 
 =  \x y -> g (f x) (f y)


-- The "comp2" definition from the book already used partial application.
-- But really, instead of hiding "x" and "y" by a lambda abstraction
-- we just could have written it out:
--
--   comp2 :: (a -> b) -> (b -> b -> c) -> (a -> a -> c)
--   comp2 f g x y
-- 
--    =  g (f x) (f y)


{- GHCi>

comp2 (+1) (+) 0 0

-}
-- 2



-- Other solution for "comp2":


comp2' :: (a -> b) -> (b -> b -> c) -> (a -> a -> c)
comp2' f g x
 
 =  g (f x) . f




-- "total":
-----------


total :: (Integer -> Integer) -> (Integer -> Integer)
total function

 =  sum . map function . \n -> [0 .. n]




-- Other solutions for "total":



total' :: (Integer -> Integer) -> (Integer -> Integer)
total' function

 =  sum . map function . count
 
 where
 
 count :: Integer -> [Integer]
 count n =  [0 .. n]



total'3 :: (Integer -> Integer) -> (Integer -> Integer)
total'3 function

 =  sum . map function . enumFromTo 0




-- Questions: How do we find the smallest/smartest definition, using partial application?
--            In which cases does using partial application make sense and in which doesn't
--            it make sense?




