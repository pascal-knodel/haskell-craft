--
--
--
-----------------
-- Exercise 6.12.
-----------------
--
--
--
module E'6'12 where



import Pictures
 (
   Picture
 , height
 , flipH
 , flipV
 , beside
 )

import Test.QuickCheck




prop_BesideFlipH :: Picture -> Picture -> Property
prop_BesideFlipH a b

 =       (height a) == (height b)
    ==>  flipH (a `beside` b) == (flipH a) `beside` (flipH b)
 
 
-- GHCi> quickCheck prop_BesideFlipH
 
 
prop_BesideFlipV :: Picture -> Picture -> Bool
prop_BesideFlipV a b

 =  flipV (a `beside` b) == (flipV b) `beside` (flipV a)

-- GHCi> quickCheck prop_BesideFlipV




