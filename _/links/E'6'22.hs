--
--
--
-----------------
-- Exercise 6.22.
-----------------
--
--
--
module E'6'22 where



import Pictures
 (
   Picture
 , beside
 , above
 , flipV
 , flipH
 , rotate
 , horse
 )

import Data.List ( intercalate )




type Picture'S =  String


horse'S :: Picture'S
horse'S =  (intercalate "\n" horse) ++ "\n"


delimiterPos :: String -> Char -> [Int]
delimiterPos []       _ =  []
delimiterPos (c : cs) d

 =  delimiterPos' (c : cs) d 1
 
 where
 
 delimiterPos' :: String -> Char -> Int -> [Int]
 delimiterPos' (c : cs) d p
 
  |  cs == []  = [ p | c == d ]
 
  |  c  /= d   =     ( delimiterPos' cs d (p + 1) )
  |  c  == d   = p : ( delimiterPos' cs d (p + 1) )
 

-- Naive split.
split :: String -> Char -> [String]
split string d

 =  [ [ string !! pos |  pos <-[ start .. (end - 1 - 1) ] ] | (start , end) <- snippetPos  ]
 
 where
 
 snippetPos =  zip ( 0 : (delimiterPos string d) ) (delimiterPos string d)
 

-- http://hackage.haskell.org/package/split-0.1.1/docs/Data-List-Split.html
-- splitOn
 
 
pic'SToPic :: Picture'S -> Picture
pic'SToPic picture'S

 =  split picture'S '\n'
 
 
picToPic'S :: Picture -> Picture'S
picToPic'S [""] =  ""
picToPic'S stringList

 =  (intercalate "\n" stringList) ++ "\n"
 
 
-- flipV --


flipV'S :: Picture'S -> Picture'S
flipV'S picture

 =  picToPic'S ( flipV (pic'SToPic picture) )


-----------


-- flipH --


flipH'S :: Picture'S -> Picture'S
flipH'S picture'S

 =  picToPic'S ( flipH (pic'SToPic picture'S) )
 

-----------


-- rotate --


rotate'S :: Picture'S -> Picture'S
rotate'S picture'S

 =  picToPic'S ( rotate (pic'SToPic picture'S) )


------------


-- invertColour --


invertColour'S :: Picture'S -> Picture'S
invertColour'S picture'S

 =  map invert'S picture'S
 

invert'S :: Char -> Char
invert'S '.' = '#'
invert'S '\n' = '\n'
invert'S _ = '.'

 
------------------


-- height --


height'S :: Picture'S -> Int
height'S [] = 0
height'S (c : cs)

 |  cs == []   = (isLineBreak c)
 |  otherwise  = (isLineBreak c) + (height'S cs)
 
 where
 
 isLineBreak :: Char -> Int
 isLineBreak char
 
  =  if (char == '\n')
     then 1
     else 0


------------


-- width --


width'S :: Picture'S -> Int
width'S picture'S

 =  lineBreakPositions !! 0
 
 where
 
 lineBreakPositions :: [Int]
 lineBreakPositions
 
  =  [ charPosition | charPosition <- [ 0 .. ] , (picture'S !! charPosition) == '\n' ]


-----------


-- above --


above'S :: Picture'S -> Picture'S -> Picture'S
above'S top'S bottom'S

 =  picToPic'S (top `above` bottom)
 
 where
 
 top :: Picture
 top =  pic'SToPic top'S
 
 bottom :: Picture
 bottom =  pic'SToPic bottom'S


-----------


-- beside --


beside'S :: Picture'S -> Picture'S -> Picture'S
beside'S left'S right'S

 =  picToPic'S (left `beside` right)
 
 where
 
 left :: Picture
 left =  pic'SToPic left'S
 
 right :: Picture
 right =  pic'SToPic right'S 


------------


-- printPicture --


printPicture'S :: Picture'S -> IO ()
printPicture'S picture'S

 =  putStr picture'S
 

------------------




