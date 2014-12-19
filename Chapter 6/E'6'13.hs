--
--
--
-----------------
-- Exercise 6.13.
-----------------
--
--
--
module E'6'13 where



import Pictures
 (
   Picture
 , beside
 , above
 )

import Test.QuickCheck




prop_AboveBeside :: Picture -> Bool
prop_AboveBeside a

 =  (putAbove `beside` putAbove) == (putBeside `above` putBeside)
 
 where
 
 putAbove :: Picture
 putAbove =  (a `above` a)
 
 putBeside :: Picture
 putBeside =  (a `beside` a)


-- GHCi> quickCheck prop_AboveBeside




