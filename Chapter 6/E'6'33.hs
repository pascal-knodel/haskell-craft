--
--
--
-----------------
-- Exercise 6.33.
-----------------
--
--
--
module E'6'33 where



import B'C'6 ( Image )

import E'6''8 ( rotate90 )

import Pictures
 (
   flipH
 , flipV
 , rotate
 )




nFlipH :: Image -> Image
nFlipH (picture , position)

 =  (flipH picture , position)
 
 
nFlipV :: Image -> Image
nFlipV (picture , position)

 =  (flipV picture , position)

 
nRotate :: Image -> Image
nRotate (picture , position)

 =  (rotate picture , position)

 
nRotate90 :: Image -> Image
nRotate90 (picture , position)

 = (rotate90 picture , position) 




