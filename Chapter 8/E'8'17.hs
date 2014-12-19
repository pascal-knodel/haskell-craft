--
--
--
-----------------
-- Exercise 8.17.
-----------------
--
--
--
module E'8'17 where



import E'8'11 ( isInteger )




sumIntegersTill0 :: IO ()
sumIntegersTill0

 =  do putStr "\nType in integers to sum up (get result typing 0)\n\n"
       sum <- (sumIntegersTill0' 0)
       putStr ("\nsum:\n\n" ++ (show sum) ++ "\n\n")
      
 where
 
 sumIntegersTill0' :: Integer -> IO Integer
 sumIntegersTill0' carry
 
  =  do input <- getLine
        if   (isInteger input)
        then (
               if   ((read input :: Integer) /= 0)
               then (sumIntegersTill0' ((read input :: Integer) + carry))
               else (return carry)
             )
        else (
               do putStr "This is not an integer.\n"
                  sumIntegersTill0' carry
             )


-- GHCi> sumIntegersTill0
-- 
-- Type in integers to sum up (get result typing 0)
-- 
-- -1
-- 1
-- 0
-- 
-- 0




