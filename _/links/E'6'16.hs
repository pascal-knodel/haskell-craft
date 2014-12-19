--
--
--
-----------------
-- Exercise 6.16.
-----------------
--
--
--
module E'6'16 where



import Pictures
 (
   Picture
 , beside
 , above
 )

import Test.QuickCheck




propAboveBeside3Correct :: Picture -> Picture -> Bool
propAboveBeside3Correct n s

 =      (n `beside` n) `above`  (s `beside` s) 
    ==  (n `above`  s) `beside` (n `above`  s) 

-- GHCi> quickCheck propAboveBeside3Correct




