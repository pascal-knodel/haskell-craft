--
--
--
-----------------
-- Exercise 6.34.
-----------------
--
--
--
module E'6'34 where



import B'C'6 ( Image )

import E'6''8 ( rotate90 )

import Pictures
 (
   Picture
 , flipH
 , flipV
 , height
 , width
 )




gFlipH :: Image -> Image   -- flips to the top 
gFlipH ([] , position) =  ([] , position)
gFlipH ( picture , (oldX , oldY) )

 =  (horizontallyFlippedPicture , newPosition)
 
 where
 
 horizontallyFlippedPicture :: Picture
 horizontallyFlippedPicture =  flipH picture
 
 newPosition :: (Integer, Integer)
 newPosition =  (newX , newY)

 newX :: Integer
 newX =  oldX
 
 newY :: Integer
 newY =  oldY - toInteger (height picture)
 
 
gFlipV :: Image -> Image   -- flips to the left
gFlipV ([] , position) =  ([] , position)
gFlipV ( picture , (oldX , oldY) )

 =  (verticallyFlippedPicture , newPosition)
 
 where
 
 verticallyFlippedPicture :: Picture
 verticallyFlippedPicture =  flipV picture
 
 newPosition :: (Integer, Integer)
 newPosition =  (newX , newY)

 newX :: Integer
 newX =  oldX - toInteger (width picture)
 
 newY :: Integer
 newY = oldY

 
gRotate :: Image -> Image
gRotate ([] , position) =  ([] , position)
gRotate image

 =  gFlipV (gFlipH image)
 
 
gRotate90 :: Image -> Image
gRotate90 ([] , position) =  ([] , position)
gRotate90 ( picture , (oldX , oldY) )

 =  (rotatedPicture90 , newPosition)
 
 where
 
 rotatedPicture90 :: Picture
 rotatedPicture90 =  rotate90 picture
 
 newPosition :: (Integer, Integer)
 newPosition =  (newX , newY)

 newX :: Integer
 newX =  oldX + toInteger (width picture)
 
 newY :: Integer
 newY =  oldY




