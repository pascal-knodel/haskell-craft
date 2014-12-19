--
--
--
-----------------
-- Exercise 6.20.
-----------------
--
--
--
module E'6'20 where



import E'6''8 ( rotate90 )

import Pictures
 (
   Picture
 , invert
 , rotate
 , invertColour
 , horse
 )




-- Transform a picture first (using (map reverse (rotate90 picture)) or sth. similar).
-- Then use the functions from Picture.hs on the result and it will work.


-- Another "working solution":


rowsToColumns :: Picture -> Picture
rowsToColumns picture

 =  map reverse (rotate90 picture)

 
horse'C :: Picture
horse'C

 =  rowsToColumns horse
 
 
-- flipV --


flipV'C :: Picture -> Picture
flipV'C

 =  reverse

 
-----------


-- flipH --


flipH'C :: Picture -> Picture
flipH'C

 =  map reverse


-----------


-- rotate --


rotate'C :: Picture -> Picture
rotate'C

 =  flipH'C . flipV'C

 
------------


-- invertColour --


invertColour'C :: Picture -> Picture
invertColour'C picture'C

 =  invertColour picture'C
 

invert'C :: Char -> Char
invert'C char

 =  invert char

 
------------------


-- height --


height'C :: Picture -> Int
height'C []        =  0
height'C picture'C =  (length . head) picture'C
 

------------


-- width --


width'C :: Picture -> Int
width'C

 =  length


-----------


-- above --


above'C :: Picture -> Picture -> Picture
above'C top bottom

 |  widthTop    < widthBottom  = zipWith (++) paddedTop bottom
 |  widthBottom < widthTop     = zipWith (++) top paddedBottom
 |  otherwise                  = zipWith (++) top bottom
 
 where
 
 widthTop :: Int
 widthTop =  width'C top
 
 widthBottom :: Int
 widthBottom =  width'C bottom
 
 padsTop :: [[Char]]
 padsTop =  replicate (widthBottom - widthTop) (replicate (height'C top) '.')
 
 paddedTop :: [[Char]]
 paddedTop =  top ++ padsTop
 
 padsBottom :: [[Char]]
 padsBottom =  replicate (widthTop - widthBottom) (replicate (height'C bottom) '.')
 
 paddedBottom :: [[Char]]
 paddedBottom =  bottom ++ padsBottom
 

-----------


-- beside --


beside'C :: Picture -> Picture -> Picture
beside'C left right

 |  heightLeft  < heightRight  = paddedLeft ++ right
 |  heightRight < heightLeft   = left ++ paddedRight
 |  otherwise                  = left ++ right
 
 where
 
 heightLeft :: Int
 heightLeft =  height'C left
 
 heightRight :: Int
 heightRight =  height'C right
 
 padsLeft :: [[Char]]
 padsLeft =  replicate (width'C left) (replicate (heightRight - heightLeft) '.')
 
 paddedLeft :: [[Char]]
 paddedLeft =  (zipWith (++) left padsLeft)
 
 padsRight :: [[Char]]
 padsRight =  replicate (width'C right) (replicate (heightLeft - heightRight) '.')
 
 paddedRight :: [[Char]]
 paddedRight =  (zipWith (++) right padsRight)
 

------------




