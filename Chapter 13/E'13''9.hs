--
--
--
-----------------
-- Exercise 13.9.
-----------------
--
--
--
module E'13''9 where



import Prelude hiding
 (
   Ord
 , (<)
 , (>)
 , (<=)
 , (>=)
 , min
 , max
 , compare
 )

import E'13''8




instance  (Ord a , Ord b) => Ord (a , b)  where

  (<) (a1 , b1) (a2 , b2)
   
   |  a1 <  a2      =  True
   
   |      a1 == a2
      &&  b1 <  b2  =  True
   
   |  otherwise     =  False
  

-- GHCi> compare ( (1,1) :: (Int,Int) ) ( (1,2) :: (Int,Int) )
-- LT



instance  Ord b => Ord [b]  where

  (<) [] [] = True
  (<) [] _  = False
  (<) _ []  = True
  (<) (b1'1 : b1's) (b2'1 : b2's)
  
    |  b1'1 <= b2'1  =  (<) b1's b2's
	|  otherwise     =  False


{- GHCi>

let b1's :: [Int] ; b1's = [0,1]
let b2's :: [Int] ; b2's = [1,1]
b1's < b2's

-}
-- True




