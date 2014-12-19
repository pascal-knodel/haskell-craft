--
--
--
-----------------
-- Exercise 5.22.
-----------------
--
--
--
module E'5'22 where



onSeparateLines :: [String] -> String
onSeparateLines xs

 =  [ c | x <- xs, c <- (x ++ "\n")]


{- GHCi>

putStr ( onSeparateLines [ "Three" , "Two" , "One" ] )

-}
-- Three
-- Two
-- One




