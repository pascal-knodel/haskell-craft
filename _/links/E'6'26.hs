--
--
--
-----------------
-- Exercise 6.26.
-----------------
--
--
--
module E'6'26 where



import E'6''7 ( printPicture )
import E'6'23 ( encode )

import Pictures
 (
   Picture
 , rotate
 , beside
 , above
 , width
 , flipV
 , flipH
 , horse
 )

import Data.List ( concat )




-- Indirect solution, using existing definitions so far ...

   
type Picture'R2 =  (  Int , [ ( Int , Char ) ]  )


{- --     epd :: Picture        --
   --     epd = [               --
   --              ".##.",      --
   --              ".#.#",      --
   --              ".###",      --
   --              "####"       --
   --            ]              -- -}


-- Example picture encoded (lines combined):
epe'R2 :: Picture'R2
epe'R2

 =  ( 4, [
           (1, '.'), (2, '#'), (2, '.'),
           (1, '#'), (1, '.'), (1, '#'),
           (1, '.'), (7, '#')
         ]
	)
         
         
horse'R2 :: Picture'R2
horse'R2 =  picToPic'R2 horse


-- conversion --


pic'R2ToPic :: Picture'R2 -> [[Char]]
pic'R2ToPic (pictureWidth, runLengths)

 =  [ [ ( pictureString !! (rowIndex * pictureWidth + columnIndex) ) 
        | columnIndex <- [ 0 .. (pictureWidth - 1) ] ] 
      | rowIndex <- [ 0 .. (pictureHeight - 1) ] ]
 
 where
 
 picture :: Picture'R2
 picture =  (pictureWidth, runLengths)
 
 pictureHeight :: Int
 pictureHeight =  height'R2 picture
 
 pictureString :: String
 pictureString =  [ char | (runLength, char) <- runLengths, _ <- [ 1 .. runLength ] ]


picToPic'R2 :: Picture -> Picture'R2
picToPic'R2 picture

 =  ( pictureWidth , runLengthEncoding )
 
 where
 
 pictureWidth :: Int
 pictureWidth =  width picture
 
 pictureString :: String
 pictureString =  concat picture
 
 runLengthEncoding :: [(Int, Char)]
 runLengthEncoding =  encode pictureString


----------------


-- flipV --


flipV'R2 :: Picture'R2 -> Picture'R2
flipV'R2 picture'R2

 =  picToPic'R2 verticalFlippedPicture
 
 where
 
 picture :: Picture
 picture =  pic'R2ToPic picture'R2
 
 verticalFlippedPicture :: Picture
 verticalFlippedPicture =  flipV picture
 

-----------


-- flipH --


flipH'R2 :: Picture'R2 -> Picture'R2
flipH'R2 picture'R2

 =  picToPic'R2 horizontalFlippedPicture
 
 where
 
 picture :: Picture
 picture =  pic'R2ToPic picture'R2
 
 horizontalFlippedPicture :: Picture
 horizontalFlippedPicture =  flipH picture


-----------


-- width --


width'R2 :: Picture'R2 -> Int
width'R2 ( charsPerRow , _ )

 =  charsPerRow


-----------


-- height --


countChars :: Picture'R2 -> Int
countChars (_, runLengths)

 =  sum [ runLength | (runLength, _) <- runLengths ]


height'R2 :: Picture'R2 -> Int
height'R2 (charsPerRow, runLengths)

 =  charsInPicture `div` charsPerRow
 
 where
 
 charsInPicture :: Int
 charsInPicture
 
  =  countChars ( charsPerRow , runLengths )


------------


-- rotate --


rotate'R2 :: Picture'R2 -> Picture'R2
rotate'R2 picture'R2

 =  picToPic'R2 rotatedPicture
 
 where
 
 picture :: Picture
 picture =  pic'R2ToPic picture'R2
 
 rotatedPicture :: Picture
 rotatedPicture =  rotate picture


------------


-- invertColour --


invertColour'R2 :: Picture'R2 -> Picture'R2
invertColour'R2 ( pictureWidth , runLengths )

 =  ( pictureWidth , map invert'R2 runLengths )


invert'R2 :: (Int, Char) -> (Int, Char)
invert'R2 ( runLength , '.' ) =  ( runLength , '#' )
invert'R2 ( runLength , _   ) =  ( runLength , '.' )


------------------


-- above --


above'R2 :: Picture'R2 -> Picture'R2 -> Picture'R2
above'R2 ( topWidth , topRunLengths ) ( bottomWidth , bottomRunLengths )

 =  ( picturePutAboveWidth , picturePutAboveRunLengths )
 
 where
 
 top'R2 :: Picture'R2
 top'R2 =  ( topWidth , topRunLengths )
 
 bottom'R2 :: Picture'R2
 bottom'R2 =  ( bottomWidth , bottomRunLengths )
 
 top :: Picture
 top =  pic'R2ToPic top'R2
 
 bottom :: Picture
 bottom =  pic'R2ToPic bottom'R2
 
 picturePutAboveWidth :: Int
 picturePutAboveWidth =  max topWidth bottomWidth
 
 picturePutAbove :: Picture
 picturePutAbove =  top `above` bottom 
 
 pictureString :: String
 pictureString =  concat picturePutAbove
 
 picturePutAboveRunLengths :: [(Int, Char)]
 picturePutAboveRunLengths =  encode pictureString
 

-----------


-- beside --


beside'R2 :: Picture'R2 -> Picture'R2 -> Picture'R2
beside'R2 ( leftWidth , leftRunLengths ) ( rightWidth , rightRunLengths )

 =  ( picturePutBesideWidth , picturePutBesideRunLengths )
 
 where
 
 picturePutBesideWidth :: Int
 picturePutBesideWidth =  leftWidth + rightWidth
 
 left'R2 :: Picture'R2
 left'R2 =  ( leftWidth , leftRunLengths )
 
 right'R2 :: Picture'R2
 right'R2 =  ( rightWidth , rightRunLengths )
 
 left :: Picture
 left =  pic'R2ToPic left'R2
 
 right :: Picture
 right =  pic'R2ToPic right'R2
 
 picturePutBeside :: Picture
 picturePutBeside =  left `beside` right 
 
 pictureString :: String
 pictureString =  concat picturePutBeside
 
 picturePutBesideRunLengths :: [(Int, Char)]
 picturePutBesideRunLengths =  encode pictureString


------------


-- printPicture --


printPicture'R2 :: Picture'R2 -> IO ()
printPicture'R2 pic

 =  printPicture (pic'R2ToPic pic)

 
------------------




