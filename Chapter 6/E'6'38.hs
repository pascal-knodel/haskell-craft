--
--
--
-----------------
-- Exercise 6.38.
-----------------
--
--
--
module E'6'38 where



import B'C'6 ( Image )

import E'6'31 ( moveImage )
import E'6'34
 (
   gFlipV
 , gFlipH
 )

import Pictures
 (
   width
 , rectangular
 )

import Test.QuickCheck




-- Definition changed. Properties have to be reviewed and are most likely to change.

prop_gRotate :: Image -> Property
prop_gRotate (picture , position)

 =       rectangular picture
    ==>  gFlipV (gFlipH image) == gFlipH (gFlipV image)
 
 where 
 
 image :: Image
 image =  (picture , position)


-- The test idea still works. The test definition has to be changed to the new type though.

-- GHCi> quickCheck prop_gRotate         


prop_gFlipV :: Image -> Property       
prop_gFlipV (picture, position)

 =       rectangular picture
    ==>  image == (  moveImage ( gFlipV (gFlipV image) ) ( 2 * (width picture) ) 0  )
 
 where 
 
 image :: Image
 image =  (picture , position)

-- The old test doesn't work any longer, because the x coordinate gets smaller with every flip.

-- GHCi> quickCheck prop_gFlipV




{- GHCi>

quickCheck prop_gRotate
quickCheck prop_gFlipV

-}




