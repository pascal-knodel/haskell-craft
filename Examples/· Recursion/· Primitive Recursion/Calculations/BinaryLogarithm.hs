module BinaryLogarithm where



import Prelude hiding (log)



-- Naive binary integer logarithm:


ilog2 :: Integer -> Integer
ilog2 integer

 | integer < 1 = error "Exponent lesser than one."
 | otherwise   = ilog2' integer
 
 where
 
 ilog2' :: Integer -> Integer
 ilog2' 1       = 0
 ilog2' integer = 1 + ilog2 (integer `div` 2)



{- GHCi>


:{
   let examples :: [Integer] ;
       examples = [ 2 ^ positiveInteger | positiveInteger <- [0, 1 .. 10] ]
:}

[ ilog2 example | example <- examples ]


-}
-- [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]


