--
--
--
-----------------
-- Exercise 4.21.
-----------------
--
--
--
module E'4'21 where



import Prelude
import qualified Prelude ( max )




maxFun :: (Integer -> Integer) -> Integer -> Integer
maxFun f n

 |  n == 0    =  0
 
 |  otherwise =  Prelude.max ( maxFun f ( n - 1 ) ) ( f n )


f :: Integer -> Integer
f 0 = 0
f 1 = 2
f 2 = 1
f _ = 0



{- GHCi>

maxFun f 3

-}
-- 2




