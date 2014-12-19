--
--
--
-----------------
-- Exercise 6.37.
-----------------
--
--
--
module E'6'37 where



import B'C'6 ( Image )

import E'6'36 ( superimposeImage )

import Pictures
 (
   height
 , width
 )




-- "How would you use Image superimposition to give analogues of above and beside for Images?"
--
--  above: First image above second image, at the second coordinates.
-- beside: First image beside second image, at the second coordinates.


imageAbove, imageBeside :: Image -> Image -> Image


imageAbove (top , _) ( bottom , (bottomX , bottomY) )

 =  superimposeImage (   top    , ( bottomX , bottomY + ( toInteger (height top) )  )   ) 
                     (   bottom , ( bottomX , bottomY                               )   ) 


imageBeside (left , _) ( right , (rightX , rightY) )

 =  superimposeImage ( left  , (  rightX - ( toInteger (width left) ) , rightY  )   )
                     ( right , (  rightX                              , rightY  )   )


-- ... other ways of using different Image superimpositions, 
-- coordinate transformations and picture positions exist.




