--
--
--
-----------------
-- Exercise 4.24.
-----------------
--
--
--
module E'4'24 where



import Test.QuickCheck




-- Subsection 4.5 ...


regions :: Integer -> Integer
regions n

 |      n < 0 =  0
 
 |     n == 0 =  1
 
 |  otherwise =  regions ( n - 1 ) + n


-- ...



pieces :: Integer -> Integer
pieces n

 |     n < 0 =  0
 
 |    n == 0 =  1
 
    -- Cake cutting theory (cake numbers, recursive):
 
 | otherwise =  pieces ( n - 1 )  +  regions ( n - 1 )



prop_pieces :: Positive Integer -> Bool
prop_pieces ( Positive n )

 =  6 * ( pieces n ) == n^3 + 5 * n + 6   -- Cake numbers, general formula.

-- GHCi> quickCheck prop_pieces




