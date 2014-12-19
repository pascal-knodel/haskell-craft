--
--
--
-----------------
-- Exercise 5.11.
-----------------
--
--
--
module E'5'11 where



type Point =  ( Float , Float )


data NewShape =     NewCircle Float Point
                 |  NewRectangle Float Float Point
                 |  NewTriangle Float Float Float Point
                 deriving ( Show )




