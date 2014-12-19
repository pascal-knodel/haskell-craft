--
--
--
----------------
-- Exercise 6.5.
----------------
--
--
--
module E'6''5 where



import E'6''4 ( superimposeChar )




superimposeLine :: [Char] -> [Char] -> [Char]
superimposeLine a b

 =  [ superimposeChar currentChar_a currentChar_b
      | ( currentChar_a , currentChar_b ) <- zippedStrings ]

 where

 zippedStrings :: [(Char, Char)]
 zippedStrings =  zip a b



-- Other solution for "superimposeLine":


superimposeLine' :: String -> String -> String
superimposeLine' []         []         =  []
superimposeLine' ( a : as ) []         =  ( superimposeChar a   '.' ) : superimposeLine as []
superimposeLine' []         ( b : bs ) =  ( superimposeChar '.' b   ) : superimposeLine [] bs
superimposeLine' ( a : as ) ( b : bs ) =  ( superimposeChar a   b   ) : superimposeLine as bs




