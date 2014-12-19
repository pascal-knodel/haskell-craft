--
--
--
-----------------
-- Exercise 4.23.
-----------------
--
--
--
module E'4'23 where



import Test.QuickCheck ( quickCheck )




-- Subsection 4.5 (extended definition) ...


regions' :: Integer -> Integer
regions' n

 |      n < 0 =  0
 
 |     n == 0 =  1
 
 |  otherwise =  regions' ( n - 1 ) + n


-- Subsection 4.5 ...


sumFun :: (Integer -> Integer) -> Integer -> Integer
sumFun f n

 |     n == 0 =  f 0
     
 |  otherwise =  sumFun f ( n - 1 ) + f n


-- ...



regionsFun :: Integer -> Integer
regionsFun n

 =  n


regions :: Integer -> Integer
regions n

 |  n <  0    =  0
 
 |  otherwise =  ( sumFun regionsFun n ) + 1



-- Other solution:

  
regions2 :: Integer -> Integer
regions2 n

 |      n < 0 =  0
 
 |  otherwise =  ( sumFun id n ) + 1 



prop_regions :: Integer -> Bool
prop_regions n

 =  ( regions n ) == ( regions' n )

-- GHCi> quickCheck prop_regions
-- +++ OK, passed 100 tests.




