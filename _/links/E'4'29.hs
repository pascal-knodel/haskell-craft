--
--
--
-----------------
-- Exercise 4.29.
-----------------
--
--
--
module E'4'29 where



import E'4'26 ( column )
import E'4'27 ( row , rowBlackAt )

import PicturesSVG
 
 (
   Picture
 , black
 , beside
 , white
 , above
 )




diagonalBoth :: Integer -> Picture
diagonalBoth length

 |  length < 1  = error "Length is lesser than one."

 |  length == 1  = black
 
 |  length == 2  =           (column black 2)
                   `beside`  (column black 2)
 
 |  otherwise    =          outer
                   `above`  inner
                   `above`  outer
 
 where
 
 outer, inner :: Picture
 
 outer =            black 
          `beside`  ( row white (length - 2) )
          `beside`  black
           
 inner =            column white ( length - 2 )
          `beside`  diagonalBoth ( length - 2 )


{- GHCi>

render (diagonalBoth 10)

-}




-- Other solution ...


rowTwoBlacksAt :: Integer -> Integer -> Integer -> Picture
rowTwoBlacksAt firstPosition secondPosition length

 |  firstPosition == secondPosition  = rowBlackAt firstPosition length
 
 |                       length < 1  = error "Length is lesser than one."
 
 |                      length == 1  = black
 
 |                      length == 2  = row black 2
 
 |  firstPosition < secondPosition   =            ( rowBlackAt firstPosition firstPosition )
                                        `beside`  ( rowBlackAt (secondPosition - firstPosition) (length - firstPosition) )

   -- |  secondPosition < firstPosition  =            ( rowBlackAt secondPosition secondPosition )
   --                                       `beside`  ( rowBlackAt (firstPosition - secondPosition) (length - secondPosition) )
 
 |                        otherwise  =            ( rowBlackAt secondPosition secondPosition )
                                        `beside`  ( rowBlackAt (firstPosition - secondPosition) (length - secondPosition) )


diagonalBoth2 :: Integer -> Picture
diagonalBoth2 n

 =  diagonalBoth2' 1 n

 where
 
 diagonalBoth2' :: Integer -> Integer -> Picture
 diagonalBoth2' left right
 
   -- Odd:
 
  |        left == right  = rowBlackAt left ( left + right )
 
   -- Even:
 
  |  left == (right - 1)  = column ( rowTwoBlacksAt left (left + 1) (left + right) ) 2

  |  otherwise            =           ( rowTwoBlacksAt left right (left + right) )
                             `above`  ( diagonalBoth2' (left + 1) (right - 1) )
                             `above`  ( rowTwoBlacksAt left right (left + right) )




