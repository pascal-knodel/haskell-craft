--
--
--
-----------------
-- Exercise 6.17.
-----------------
--
--
--
module E'6'17 where



import Pictures
 (
   Picture
 , width
 , height
 )

import Test.HUnit




myAbove :: Picture -> Picture -> Picture
myAbove top bottom

 |  widthTop < widthBottom  = ( padRight top (widthBottom - widthTop) ) ++ bottom
 |  widthBottom < widthTop  = top ++ ( padRight bottom (widthTop - widthBottom) )
 |  otherwise               = top ++ bottom
 
 where
 
 widthTop :: Int
 widthTop =  width top
 
 widthBottom :: Int
 widthBottom =  width bottom
 
 padRight :: Picture -> Int -> Picture
 padRight picture padColumns

  =  zipWith (++) picture rightPadding
  
  where
 
  rightPadding :: Picture
  rightPadding =  replicate (height picture) [ '.' | _ <- [1 .. padColumns] ]


myBeside :: Picture -> Picture -> Picture
myBeside left right

 |  heightLeft  < heightRight  = zipWith (++) ( padBottom left (heightRight - heightLeft) ) right
 |  heightRight < heightLeft   = zipWith (++) left ( padBottom right (heightLeft - heightRight) )
 |  otherwise                  = zipWith (++) left right
 
 where
 
 heightLeft :: Int
 heightLeft =  height left
 
 heightRight :: Int
 heightRight =  height right
 
 padBottom :: Picture -> Int -> Picture
 padBottom picture padRows

  =  picture ++ bottomPadding
  
  where
 
  bottomPadding :: Picture
  bottomPadding =  replicate padRows [ '.' | _ <- [1 .. (width picture)] ]


-- Unit tests:


testMyAbove1

 = TestCase ( assertEqual "" (["..", ".."]) ([".."] `myAbove` ["."]) )

-- GHCi> runTestTT testMyAbove1


testMyBeside1

 = TestCase ( assertEqual "" (["..", ".."]) ([".", "."] `myBeside` ["."]) )

-- GHCi> runTestTT testMyBeside1




