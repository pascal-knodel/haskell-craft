--
--
--
-----------------
-- Exercise 4.22.
-----------------
--
--
--
module E'4'22 where




hasZeroReturn :: (Integer -> Integer) -> Integer -> Bool
hasZeroReturn f n

 |  n <  0    =  error "The argument is not a natural number."
 
 |  n == 0    =  f n == 0
 
 |  otherwise =  f n == 0  ||  hasZeroReturn f ( n - 1 )


{- GHCi>

:{
   let f :: Integer -> Integer ;
       f 0 = 0 ;
       f _ = 1
:}

hasZeroReturn f ( -1 )
hasZeroReturn f    2

:{
   let f :: Integer -> Integer ;
       f _ = 1
:}

hasZeroReturn f ( -1 )
hasZeroReturn f    2

-}
-- *** Exception: The argument is not a natural number.
-- True
--
-- *** Exception: The argument is not a natural number.
-- False




