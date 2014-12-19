--
--
--
-----------------
-- Exercise 4.27.
-----------------
--
--
--
module E'4'27 where



import E'4'26 ( column )

import PicturesSVG
 
 (
   Picture
 , black
 , beside
 , white
 , above
 )




row :: Picture -> Integer -> Picture
row picture repetitions

 | repetitions == 1 =  picture
 | otherwise        =            picture 
                       `beside`  row picture ( repetitions - 1 )
  

  
diagonalLR :: Integer -> Picture -- (from top) Left (to bottom) Right; LR
diagonalLR length

 | length <  1 =  error "Argument is lesser than one. Nothing to draw."
 
 | length == 1 =  black
 
 | otherwise   =           (  ( diagonalLR (length - 1) )  `beside`  ( column white (length - 1) )  )
                  `above`  (  ( row white (length - 1)  )  `beside`  black                          )




-- Other solution ...


whiteSquares :: Integer -> Picture
whiteSquares repetitions

 |  repetitions <= 1 =  white
 
 |         otherwise =  white  `beside`  whiteSquares ( repetitions - 1 )


rowBlackAt :: Integer -> Integer -> Picture
rowBlackAt position length

 |        position < 1
      ||  length   < 1 =  error "At least one argument is lesser than one. Nothing to draw."
    
 |   position > length =  error "A position greater than length is not possible."
 
 |       position == 1 =  black
 
 |  position == length =  left `beside` black
 
 |           otherwise =            left 
                          `beside`  black
                          `beside`  right
 
 where
 
 left :: Picture
 left  =  whiteSquares ( position - 1 )
 
 right :: Picture
 right =  whiteSquares ( length - position )



diagonalLR2 :: Integer -> Picture -- (from top) Left (to bottom) Right; LR
diagonalLR2 length

 =  diagonalLR2' length length
 
 where 
 
 diagonalLR2' :: Integer -> Integer -> Picture
 diagonalLR2' currentLength completeLength

  | length <  1        =  error "Argument is lesser than one. Nothing to draw."
  
  | currentLength == 1 =  rowBlackAt 1 completeLength
  
  | otherwise          =           ( diagonalLR2' (currentLength - 1) completeLength )
                          `above`  ( rowBlackAt currentLength completeLength         )




