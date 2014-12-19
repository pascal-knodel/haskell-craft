--
--
--
-----------------
-- Exercise 6.31.
-----------------
--
--
--
module E'6'31 where



import B'C'6 ( Image )

import E'6'30 ( changePosition )




moveImage :: Image -> Int -> Int -> Image
moveImage (  picture , (pictureX , pictureY)  ) changeX changeY

 =  changePosition image (newX , newY)

 where
 
 oldX, oldY, newX, newY :: Integer
 
 oldX =  pictureX
 oldY =  pictureY
 
 newX =  oldX + (toInteger changeX)
 newY =  oldY + (toInteger changeY)
 
 image :: Image
 image =  ( picture , (pictureX , pictureY) )




