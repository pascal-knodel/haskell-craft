--
--
--
------------------
-- Exercise 11.21.
------------------
--
--
--
module E'11'21 where



import Data.List (foldl')




iter' :: Integer -> (a -> a) -> (a -> a)
iter' times function

 =  foldl' (.) id $ replicate (fromInteger times :: Int) function


 

