--
--
--
-----------------
-- Exercise 8.12.
-----------------
--
--
--
module E'8'12 where



putNtimes :: Integer -> String -> IO ()
putNtimes 0 _ = putStr ""
putNtimes times string

 =  do putStrLn string
       putNtimes (times - 1) string


{- GHCi>

putNtimes 3 "go"

-}
-- go
-- go
-- go




