-- (Chapter 8)
module E26 where



definition :: IO ()
definition

 = do input <- getLine
      putStr changedInput
      
   where
   
   changedInput = input ++ "\n"



-- Possible correction:
{-


definition :: IO ()
definition

 = do input <- getLine
      putStr (input ++ "\n")

 
-}


