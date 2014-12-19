--
--
--
-----------------
-- Exercise 3.14.
-----------------
--
--
--
module E'3'14 where



import Prelude hiding ( min )




min :: Int -> Int -> Int
min a b

 |  a < b      = a
 |  otherwise  = b



minThree :: Int -> Int -> Int -> Int
minThree a b c

 |      a < b 
    &&  a < c  = a
  
 |  b < c      = b
 
 |  otherwise  = c




