--
--
--
------------------
-- Exercise 10.26.
------------------
--
-- 
--
module E'10'26 where



import E'10'24 ( dropUntil )




-- From chapter 7 ...


type Word =  String
type Line =  [Word]


whitespace :: String
whitespace =  [ '\n' , '\t' , ' ' ]


-- From chapter 10 ...


getUntil :: (a -> Bool) -> [a] -> [a]
getUntil _ [] = [] 
getUntil p ( x : xs )

  |        p x =  []
  
  |  otherwise =  x : getUntil p xs


-- ...



isWhitespace :: Char -> Bool
isWhitespace character

 =  character `elem` whitespace


splitLines :: String -> Int -> [[String]]
splitLines string lineLength

 =  splitLines' string [] lineLength 0
 
 where

 splitLines' :: String -> [String] -> Int -> Int -> [[String]]
 splitLines' ""     lineAcc _          _         =  [ lineAcc ]
 splitLines' string lineAcc lineLength lengthAcc

  |  lengthAcc + length word <= lineLength =  splitLines' remaining ( lineAcc ++ [word] ) lineLength ( lengthAcc + length word + 1 )
  
  |                              otherwise =  lineAcc : splitLines' string [] lineLength 0
  
  where
  
  word , remaining :: String

  word      =  getUntil isWhitespace string
  remaining =  dropUntil ( not . isWhitespace ) ( dropUntil isWhitespace string )

  

-- Note: "lineAcc" is for accumulating incomplete lines till they are complete (or till it's
--       the last line). That is if the accumulator for line-lengths, "lengthAcc" plus the 
--       length of the next word would exceed the given line-length.
--       "splitLines" can be transformed in tail recursive form by adding a boolean argument.
--       I didn't do it, because I think it would reduce readability. This solution is based
--       on how chapter 7 handles the problem (splitting a 'String' into '[Word]' into '[Line]').



{- GHCi>

splitLines "12 45 78" 5

-}
-- [  [ "12" , "45" ] , [ "78" ]  ]




-- Other solution (to a simpler problem) ...


isNewline :: Char -> Bool
isNewline character

 =  character == '\n'


splitLines2 :: String -> [String]
splitLines2 "" = []
splitLines2 string

 = getUntil isNewline string : splitLines2 ( dropUntil (not . isWhitespace) (dropUntil isNewline string) )


{- GHCi>

splitLines2 "line 1\nline 2"

-}
-- [ "line 1" , "line 2" ]




