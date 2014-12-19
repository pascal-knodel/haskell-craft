--
--
--
-----------------
-- Exercise 8.14.
-----------------
--
--
--
module E'8'14 where



import Data.List ( words )




-- Note: This time I consider every character or consecutive appearance
--       of characters that are not whitespace a word.


wc :: IO ()
wc

 =  wc' (0 , 0 , 0)
 
 where
 
 wc' :: (Integer , Integer , Integer) -> IO ()
 wc' ( lineCount , wordCount , charCount )
   -- "currentCount" is the 'loop data'

  =  do input <- getLine
        putStr input
        putStr "\n"
        if   (input /= "")
        then (
               wc' (
                     lineCount + 1                                                       ,
                     wordCount + (   toInteger (  length ( words input          )  )   ) ,
                     charCount + (   toInteger (  length ( concat (words input) )  )   )
                   )
             )
        else (
               do putStr ( "lines count: " ++ (show lineCount) ++ "\n"   )
                  putStr ( "words count: " ++ (show wordCount) ++ "\n"   )
                  putStr ( "chars count: " ++ (show charCount) ++ "\n\n" )
             )


-- GHCi> wc
-- 1 23
-- 1 23
-- 
-- 
-- lines count: 1
-- words count: 2
-- chars count: 3




