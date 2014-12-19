--
--
--
----------------
-- Exercise 6.7.
----------------
--
--
--
module E'6''7 where



import Pictures ( Picture )

import Data.List ( intercalate )




-- We need to place a line break after each line of a picture.
-- Hoogle: http://www.haskell.org/hoogle/?hoogle=[[a]]+-%3E+[a]+-%3E+[[a]]
-- I searched for [[a]] -> [a] -> [[a]] and it told me, that Data.List.intercalate 
-- would come in handy.


printPicture :: Picture -> IO ()
printPicture picture

 =  putStr ( (intercalate "\n" picture) ++ "\n" )



-- Other solution for "printPicture":


printPicture' :: Picture -> IO ()
printPicture' picture

 =  putStr brokenLines
 
 where
 
 lineBreak :: String
 lineBreak =  "\n"
 
 brokenLines :: String
 brokenLines =  [ currentChar | line <- picture , currentChar <- (line ++ lineBreak) ]




