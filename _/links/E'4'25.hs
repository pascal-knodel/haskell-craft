--
--
--
-----------------
-- Exercise 4.25.
-----------------
--
--
--
module E'4'25 where



import PicturesSVG
 
 (
   Picture
 , black
 , beside
 , white
 , above
 )




blackWhite :: Integer -> Picture
blackWhite n
 
 |     n <= 1 =  black
 
 |  otherwise =  black  `beside`  whiteBlack ( n - 1 )



whiteBlack :: Integer -> Picture
whiteBlack n
 
 |     n <= 1 =  white
 
 |  otherwise =  white  `beside`  blackWhite ( n - 1 )



blackChess :: Integer -> Integer -> Picture
blackChess n m
 
 |     n <= 1 =  blackWhite m
 
 |  otherwise =  blackWhite m  `above`  whiteChess ( n - 1 ) m



whiteChess :: Integer -> Integer -> Picture
whiteChess n m
 
 |    n <= 1 =  whiteBlack m
 
 | otherwise =  whiteBlack m  `above`  blackChess ( n - 1 ) m




