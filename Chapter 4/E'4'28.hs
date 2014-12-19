--
--
--
-----------------
-- Exercise 4.28.
-----------------
--
--
--
module E'4'28 where



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




diagonalRL :: Integer -> Picture -- (from top) Right (to bottom) Left; RL
diagonalRL length

 |  length <  1 =  error "Argument is lesser than one. Nothing to draw."
 
 |  length == 1 =  black
 
 |  otherwise   =           (  ( row white (length - 1)  )  `beside`  black                          )
                   `above`  (  ( diagonalRL (length - 1) )  `beside`  ( column white (length - 1) )  )




-- Other solution ...


diagonalRL2 :: Integer -> Picture -- (from top) Right (to bottom) Left; RL
diagonalRL2 length

 =  diagonalRL2' length length
 
 where 
 
 diagonalRL2' :: Integer -> Integer -> Picture
 diagonalRL2' currentLength completeLength

  | completeLength < 1 =  error "Argument is lesser than one. Nothing to draw."
  
  | currentLength == 1 =  rowBlackAt 1 completeLength
  
  | otherwise          =           ( rowBlackAt currentLength completeLength         )
                          `above`  ( diagonalRL2' (currentLength - 1) completeLength )




