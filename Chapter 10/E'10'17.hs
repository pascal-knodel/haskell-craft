--
--
--
------------------
-- Exercise 10.17.
------------------
--
--
--
module E'10'17 where




-- Note: Remember chapter 6, ex. 6.41 for example and chapter 7.



formatList :: (a -> String) -> [a] -> String
formatList formatItem list

 = foldr ( ++ ) [] ( map formatItem list )



formatLines :: [Line] -> String
formatLines lines = formatList formatLine lines


type Line = String   -- For example.


formatLine :: Line -> String
formatLine line = line ++ "\n"   -- For example.



{- GHCi>

formatLines [ [ "line 1" ] , [ "line 2" ] ]

-}
-- "line 1\nline 2\n"




