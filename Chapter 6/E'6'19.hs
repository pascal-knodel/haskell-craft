--
--
--
-----------------
-- Exercise 6.19.
-----------------
--
--
--
module E'6'19 where



import E'6''6 ( superimpose )

import Pictures
 (
   Picture
 , horse
 )




type Picture'B =  [[Bool]]   -- B; "Binary" (black/white) picture.


black :: Bool
black =  True

white :: Bool
white =  False


-- flipV --


flipV'B :: Picture'B -> Picture'B
flipV'B

 =  map reverse

 
-----------


-- flipH --


flipH'B :: Picture'B -> Picture'B
flipH'B

 =  reverse


-----------


-- rotate --


rotate'B :: Picture'B -> Picture'B
rotate'B

 =  flipH'B . flipV'B

 
------------


-- invertColour --


invertColour'B :: Picture'B -> Picture'B
invertColour'B

 =  map (map invert'B)
 

invert'B :: Bool -> Bool
invert'B colour

 =  not colour

 
------------------


-- height --


height'B :: Picture'B -> Int
height'B

 =  length
 

------------


-- width --


width'B :: Picture'B -> Int
width'B [] =  0
width'B picture'B =  (length . head) picture'B


-----------


-- above --


above'B :: Picture'B -> Picture'B -> Picture'B
above'B top bottom

 |  widthTop < widthBottom  = paddedTop ++ bottom
 |  widthBottom < widthTop  = top ++ paddedBottom
 |  otherwise               = top ++ bottom
 
 where
 
 widthTop :: Int
 widthTop =  width'B top
 
 widthBottom :: Int
 widthBottom =  width'B bottom
 
 padsTop :: [[Bool]]
 padsTop =  replicate (height'B top) (replicate (widthBottom - widthTop) white)
 
 paddedTop :: [[Bool]]
 paddedTop =  zipWith (++) top padsTop
 
 padsBottom :: [[Bool]]
 padsBottom =  replicate (height'B bottom) (replicate (widthTop - widthBottom) white)
 
 paddedBottom :: [[Bool]]
 paddedBottom =  zipWith (++) bottom padsBottom


-----------


-- beside --


beside'B :: Picture'B -> Picture'B -> Picture'B
beside'B left right

 |  heightLeft  < heightRight  = zipWith (++) paddedLeft right
 |  heightRight < heightLeft   = zipWith (++) left paddedRight
 |  otherwise                  = zipWith (++) left right
 
 where
 
 heightLeft :: Int
 heightLeft =  height'B left
 
 heightRight :: Int
 heightRight =  height'B right
 
 padsLeft :: [[Bool]]
 padsLeft =  replicate (heightRight - heightLeft) (replicate (width'B left) white)
 
 paddedLeft :: [[Bool]]
 paddedLeft =  left ++ padsLeft
 
 padsRight :: [[Bool]]
 padsRight =  replicate (heightLeft - heightRight) (replicate (width'B right) white)
 
 paddedRight :: [[Bool]]
 paddedRight =  right ++ padsRight


------------


-- printPicture --


listsListToList :: [[a]] -> [a]
listsListToList listsList

 =  [ item | list <- listsList, item <- list ]

-- http://www.haskell.org/hoogle/?hoogle=[[a]]+-%3E+[a]
-- listsListToList = concat
 

printPicture'B :: Picture'B -> IO ()
printPicture'B bPicture

 =  putStr ( listsListToList [ columnToString column | column <- bPicture ] )
 
 where

 columnToString :: [Bool] -> String
 columnToString column
 
  =  ( [ shade pixel | pixel <- column ] ++ ['\n'] ) 
  
 shade :: Bool -> Char
 shade pixel
 
  |  (pixel == black)                  = '#'
  |  otherwise {- (pixel == white) -}  = '.'

  
------------------
  
  
picTopic'B :: Picture -> Picture'B
picTopic'B picture

 =  [ shadeColumn pColumn | pColumn <- picture ]
  
 where
 
 shadeColumn :: String -> [Bool]
 shadeColumn pColumn
 
  =  [ shadePixel pChar | pChar <- pColumn ]
 
 
 shadePixel :: Char -> Bool
 shadePixel char
 
  |  char == '.'  = white
  |  otherwise    = black

  
pic'BToPic :: Picture'B -> Picture
pic'BToPic picture'b
  
 =  [ shadeBcolumn bpColumn | bpColumn <- picture'b ]
 
 where
 
 shadeBcolumn :: [Bool] -> String
 shadeBcolumn bpColumn
 
  =  [ shadePixel pixel | pixel <- bpColumn ]
 
 shadePixel :: Bool -> Char
 shadePixel pixel
 
  |  (pixel == black)                  = '#'
  |  otherwise {- (pixel == white) -}  = '.'
 

horse'B :: Picture'B
horse'B =  picTopic'B horse

 
-- Property testing:


prop_picToPic'BToPic :: Picture -> Bool
prop_picToPic'BToPic picture

 =  (  (superimpose picture picture) == ( pic'BToPic (picTopic'B picture) )  )

-- GHCi> quickCheck prop_picToPic'BToPic


  
  
-------------------------------------------------------------------------
--
-- Lessons learned (... 6.19 ...):
--
-- ~ Type design is important (the better the type fits to the
--   problem the easier ...).
-- ~ Don't write "big" nested list comprehensions directly (readability).
--
-------------------------------------------------------------------------




