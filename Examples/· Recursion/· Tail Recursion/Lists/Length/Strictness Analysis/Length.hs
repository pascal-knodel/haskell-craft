-- Determine the length of a list.
module Length where



import Prelude hiding (length)




length :: [t] -> Integer
length list

 =  length' list 0
 
 where
 
 length' :: [t] -> Integer -> Integer
 length' [] lengthAccumulator = lengthAccumulator
 length' (listItem : remainingListItems) lengthAccumulator
 
  =  length' remainingListItems $! (lengthAccumulator + 1)   -- "$!" is 'strict application'.



{- GHCi>

length ""
length "123456789"

-}
-- 0
-- 9




-- Profiling time and allocation for "length" at an input list that contains 10^5 elements:
-------------------------------------------------------------------------------------------

profile :: IO ()
profile =  print $ length [1 .. 10^5]

--
-- System          :   Windows 8.1 Pro 64 Bit (6.3, Build 9600)
--                     Intel(R) Core(TM) i5 CPU M 460 @ 2.53 GHz (4 CPUs), ~2.5 GHz
--                     4096 MB RAM
--
-- Antivirus / ... :   deactivated
--
-- Compiler        :   GHC 7.8.3
--
--
-- Result: 
--
-------------------------------------------------------------------------------------------




