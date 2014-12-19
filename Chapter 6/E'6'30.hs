--
--
--
-----------------
-- Exercise 6.30.
-----------------
--
--
--
module E'6'30 where



import B'C'6
 (
   Position
 , Image
 )




changePosition :: Image -> Position -> Image
changePosition (  picture , ( oldX , oldY )  ) ( newX , newY )

 =  (  picture , ( newX , newY )  )




