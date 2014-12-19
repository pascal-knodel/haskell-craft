-- List length. Tail Recursion with "foldl".
module Length where



import Prelude hiding (length)

import Data.List (foldl)




length :: [t] -> Integer
length =  foldl (\lengthAccumulator item -> lengthAccumulator + 1) 0


{- GHCi>

length ""
length "1"
length "12"

-}
-- 0
-- 1
-- 2




-- foldl :: (b -> a -> b) -> b -> [a] -> b
-- foldl f z0 xs0
--
--  =  lgo z0 xs0
--
--  where
--
--  lgo z []     =  z
--  lgo z (x:xs) =  lgo (z `f` x) xs


--        length "123"
--    =   foldl (\lengthAccumulator item -> lengthAccumulator + 1) 0 "123"
--    =   lgo 0 "123"
--
--        where  f  =  \lengthAccumulator item -> lengthAccumulator + 1
--
--    =   lgo        0                                ('1' : "23")
--   ~>   lgo  (     0 `f` '1'                     )         "23"
--    =   lgo  (     0 `f` '1'                     )  ('2' :  "3")
--   ~>   lgo  (    (0 `f` '1') `f` '2'            )          "3"
--    =   lgo  (    (0 `f` '1') `f` '2'            )  ('3' :   [])
--   ~>   lgo  (  ( (0 `f` '1') `f` '2' ) `f` '3'  )           []
--
--   ~>        (  ( (0 `f` '1') `f` '2' ) `f` '3'  )
--   ~>        (  ( (0 + 1)     `f` '2' ) `f` '3'  )
--
--   ~>        (  (  1          `f` '2' ) `f` '3'  )
--   ~>        (  (  1 + 1              ) `f` '3'  )
--
--   ~>        (     2                    `f` '3'  )
--   ~>        (     2 + 1                         )
--
--   ~>              3                     




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
-- 10^7
--


-- Note: After little time there will be serious indications (system becomes slower) that 
--       the program runs out of memory. And we know why.
--       The problem is the growing 'accumulator thunk' - the bigger the
--       input size, the more memory is needed to store this not yet evaluated expression:
--
--       (      (  ...  ( (0 `f` "1") `f` "2" )  `f`  ...  )   `f`   "N"   )
--
--       N denotes the last element in a list of length N. Well on my computer this approach
--       came with an improvement: 10^7 is in the result list of tail recursion, while
--       primitive recursion got until 10^6.




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




