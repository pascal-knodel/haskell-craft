--
--
--
-----------------
-- Exercise 7.10.
-----------------
--
--
--
module E'7'10 where



import E'7''8 ( elemNum )
import E'7''9 ( unique )

import Test.QuickCheck




prop_elemNum_unique :: Integer -> [Integer] -> Bool
prop_elemNum_unique integer integerList

 =  (elemNum integer (unique integerList)) `elem` [ 0 , 1 ]


-- GHCi> quickCheck prop_elemNum_unique




