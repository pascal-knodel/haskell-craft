--
--
--
----------------
-- Exercise 5.8.
----------------
--
--
--
module E'5''8 where



import E'5''5 (  Shape ( Circle , Rectangle , Triangle )  )




isSquare :: Shape -> Bool
isSquare (Rectangle width height)
        
 |  width == height  = True
 |  otherwise        = False


isEquilateral :: Shape -> Bool
isEquilateral (Triangle a b c)
 
 |      a == b
    &&  b == c  = True
 |  otherwise   = False 


isRegular :: Shape -> Bool
isRegular (Circle _) = True
isRegular (Rectangle height width) = isSquare (Rectangle height width)
isRegular (Triangle a b c) = isEquilateral (Triangle a b c)




