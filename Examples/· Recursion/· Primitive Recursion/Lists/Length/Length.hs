-- List length computation. Primitive Recursion.
module Length where



import Prelude hiding (length)




length :: [t] -> Integer
length [] =  0
length (listItem : remainingListItems)

 =  1 + (length remainingListItems)


{- GHCi>

length ""
length "1"
length "12"

-}
-- 0
-- 1
-- 2




-- Results of "length" on a list that increases at each element by a power of 10 in an infinite list:
samples :: [Integer]
samples =  [ length [1 .. 10^n] | n <- [1 ..] ]


-- "sample n" represents the application of "length" to a list that contains 10^n elements:
sample :: Int -> Integer
sample number =  samples !! number


-- Helper, that formats numbers in scientific notation with powers of 10:
format :: Integer -> String
format 10      =  "10"
format integer =  "10^" ++ (show $ truncate $ log (fromIntegral integer :: Float) / log 10)




{- GHCi>


:{

let count n = do putStrLn $ format $ sample n
                 count (n + 1)
 in count 0
 
:}


-}
-- 10
-- 10^2
-- 10^3
-- 10^4
-- 10^5
-- 10^6
-- *** Exception: stack overflow


-- Note: depends on your compiler, stack settings, ...
--       but since stack size is limited it will happen.




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




