--
--
--
-----------------
-- Exercise 6.23.
-----------------
--
--
--
module E'6'23 where



import E'6''7 ( printPicture )

import Pictures
 (
   Picture
 , horse
 )




type Picture'R =  [  [ ( Int , Char ) ]  ]   -- R; Run-length encoding


-- Example picture decoded:
epd :: Picture
epd =  [
         ".##.",
         ".#.#",
         ".###",
         "####"
       ]

-- Example picture encoded:
epe :: Picture'R
epe =  [
         [(1, '.'), (2, '#'), (1, '.')],
         [(1, '.'), (1, '#'), (1, '.'), (1, '#')],
         [(1, '.'), (3, '#')],
         [(4, '#')]
       ]


-- run-length encoding --


type RunLengths =  [(Int, Char)]


encode :: String -> RunLengths
encode string

 =  encode' 1 string
 
 where
 
 encode' :: Int -> String -> RunLengths
 encode' _ []            = []
 encode' length (c : []) = [ ( length , c) ]
 encode' length (c0 : c1 : cs)
 
  |  c0 == c1   = encode' (length + 1) (c1 : cs)
  |  otherwise  = (length, c0) : encode' 1 (c1 : cs)


-------------------------


-- picture conversion --
     
     
picToPic'R :: Picture -> Picture'R
picToPic'R picture

 =  [ encode row | row <- picture ]
 
 
horse'R :: Picture'R
horse'R =  picToPic'R horse
 
 
pic'RToPic :: Picture'R -> Picture
pic'RToPic picture'R

 =  [ [ char | (runLength, char) <- row , _ <- [1 .. runLength] ] | row <- picture'R ]
 
 
-----------------------
 
 
-- flipV --


flipV'R :: Picture'R -> Picture'R
flipV'R picture'R

 =  map (reverse) picture'R
 

-----------


-- flipH --


flipH'R :: Picture'R -> Picture'R
flipH'R picture'R

 =  reverse picture'R

 
-----------


-- width --


width'R :: Picture'R -> Int
width'R picture'R

 =  sum firstRowRunLengths
 
 where
 
 firstRowRunLengths :: [Int]
 firstRowRunLengths =  [ runLength | (runLength, _) <- (picture'R !! 0) ]
 
 sum :: [Int] -> Int
 sum [] = 0
 sum (i : is) =  i + (sum is)


-----------


-- height --


height'R :: Picture'R -> Int
height'R picture'R

 =  length picture'R


------------


-- rotate --


rotate'R :: Picture'R -> Picture'R
rotate'R picture'R

 =  (flipH'R . flipV'R) picture'R


------------


-- invertColour --


invertColour'R :: Picture'R -> Picture'R
invertColour'R picture'R

 =  map (map invert'R) picture'R
 

invert'R :: (Int, Char) -> (Int, Char)
invert'R (runLength, '.') =  (runLength, '#')
invert'R (runLength, _  ) =  (runLength, '.')

 
------------------


-- above --


above'R :: Picture'R -> Picture'R -> Picture'R
above'R top bottom

 =  top ++ bottom


-----------


-- beside --


beside'R :: Picture'R -> Picture'R -> Picture'R
beside'R left right

 =  zipWith (++) left right


------------


-- printPicture --


printPicture'R :: Picture'R -> IO ()
printPicture'R picture'R


 =  printPicture (pic'RToPic picture'R)
 

------------------




