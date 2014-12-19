--
--
--
-----------------
-- Exercise 4.20.
-----------------
--
--
--
module E'4'20 where




isqrt :: Integer -> Integer   -- I; Integer square root
isqrt i

 |  i <  0    =  error "The argument is not a natural number."
 
   -- Newton's method:
   
 |  i == 0    =  0
 
 |  i == 1    =  1

   -- Recursion step: 
   
 |  otherwise =  ( step + ( ( i - 1 ) `div` step ) ) `div` 2
      
 where

 step :: Integer
 step =  isqrt ( i - 1 )


{- GHCi>

isqrt ( -1 )
isqrt    0
isqrt    1
isqrt    2
isqrt    3
isqrt    4

-}
-- *** Exception: The argument is not a natural number.
-- 0
-- 1
-- 1
-- 1
-- 2




-- Other solution ...


-- Primitive recursion like in the template (see subchapter 4.5):

isqrt2 :: Integer -> Integer
isqrt2 i

 |  i <  0    =  error "The argument is not a natural number."
 
   -- Newton's method:
   
 |  i == 0    =  0

   -- Recursion step:
 
 |  otherwise =  ( step + ( ( i - 1 ) `div` step ) ) `div` 2
      
 where

 step :: Integer
 
 step =     isqrt ( i - 1 )
         +  if ( i == 1 ) then 2 else 0




