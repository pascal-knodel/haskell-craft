-- List length. Primitive Recursion with "foldr".
module Length where



import Prelude hiding (length)

import Data.List (foldr)




length :: [t] -> Integer
length =  foldr (\item lengthAccumulator -> lengthAccumulator + 1) 0


{- GHCi>

length ""
length "1"
length "12"

-}
-- 0
-- 1
-- 2




-- foldr :: (a -> b -> b) -> b -> [a] -> b
-- foldr k z =  go
--
--  where
--  
--  go []     =  z
--  go (y:ys) =  y `k` go ys


--        length "123"
--    =   foldr (\item lengthAccumulator -> lengthAccumulator + 1) 0 "123"
--    =   go "123"
--
--        where  k =  \item lengthAccumulator -> lengthAccumulator + 1
--
--    =                               go  ('1' : "23")
--   ~>   '1' `k`                     go         "23"
--    =   '1' `k`                     go  ('2' :  "3")
--   ~>   '1' `k` ( '2' `k`           go          "3"  )
--    =   '1' `k` ( '2' `k`           go  ('3' :   []) )
--   ~>   '1' `k` ( '2' `k` ('3' `k`  go           []) )
--
--   ~>   '1' `k` ( '2' `k` ('3' `k`  0) )
--   ~>   '1' `k` ( '2' `k` (0 + 1) )
--
--   ~>   '1' `k` ( '2' `k` 1 )
--   ~>   '1' `k` ( 1 + 1 )
--
--   ~>   '1' `k` 2
--   ~>   2 + 1
--
--   ~>   3




-- Results of "length" on a list that increases at each element by a power of 10 in an infinite list:
samples :: [Integer]
samples =  [ length [1 .. 10^n] | n <- [1 ..] ]


-- "sample n" represents the application of "length" to a list that contains 10^n elements:
sample :: Int -> Integer
sample number =  samples !! number


-- A helper, that formats numbers in scientific notation with powers of 10:
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
-- 10^7
-- *** Exception: stack overflow




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




