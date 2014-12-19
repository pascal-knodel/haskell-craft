--
--
--
-----------------
-- Exercise 8.18.
-----------------
--
--
--
module E'8'18 where



-- Note: Chapter 7> cabal install

import E'7'12 ( ins )   

import E'8'11 ( isInteger )

import GHC.Base ( map )
import Data.List ( intercalate )




sortIntegers :: IO ()
sortIntegers

 =  do putStr "\nType in integers to sort (get result typing 0)\n\n"
       sortedList <- (sortIntegers' [])
       putStr (  '\n' : ( intercalate ", " (map show sortedList) ) ++ "\n\n"  )
      
 where
 
 sortIntegers' :: [Integer] -> IO [Integer]
 sortIntegers' carry
 
  =  do input <- getLine
        if   (isInteger input)
        then (
               if   ( (read input :: Integer) /= 0 )
               then (  sortIntegers' ( ins (read input :: Integer) carry )  )
               else (return carry)
             )
        else (
               do putStr "This is not an integer.\n"
                  sortIntegers' carry
             )


-- I used insertion sort. From an algorithmic/domain viewpoint there may still exist better 
-- (hybrid-) solutions (depending on the input-size, response time, energy consumption ...).
-- If you want a quick result after the user typed in 0, then insertion sort should do OK. If the
-- number of integers that will be typed in is known to be small, they will be sorted in time
-- (without noticeable delay) even if we sort after all input was received and we might use a more
-- efficient algorithm (quick sort, merge sort, ...).




