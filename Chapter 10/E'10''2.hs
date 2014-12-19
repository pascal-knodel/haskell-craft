--
--
--
-----------------
-- Exercise 10.2.
-----------------
--
-- How would you define the "length" function using "map" and "sum"?
--
--
--
module E'10''2 where



import Prelude hiding    ( length )   -- GHC.List.length.
import qualified Prelude ( length )

import Test.QuickCheck ( quickCheck )




length :: [t] -> Int
length list

 = ( fromInteger . sum ) ( map one list )
 
 where
 
 one :: t -> Integer
 one _ = 1




prop_length :: [t] -> Bool
prop_length list

 = length list == Prelude.length list


-- GHCi> quickCheck prop_length




