--
--
--
-----------------
-- Exercise 6.11.
-----------------
--
--
--
module E'6'11 where



import Pictures
 (
   Picture
 , flipH
 , above
 )

import Test.QuickCheck




prop_AboveFlipH :: Picture -> Picture -> Bool
prop_AboveFlipH a b

 =  flipH (a `above` b) == (flipH b) `above` (flipH a)
 
-- GHCi> quickCheck prop_AboveFlipH




