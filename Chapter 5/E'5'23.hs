--
--
--
-----------------
-- Exercise 5.23.
-----------------
--
--
--
module E'5'23 where



duplicate :: String -> Integer -> String
duplicate string repetitions

 =  [ character | repetition <- [1 .. repetitions] , character  <- string ]


{- GHCi>

duplicate "ABC " 1
duplicate "ABC " 2
duplicate "ABC " 3

-}
-- "ABC "
-- "ABC ABC "
-- "ABC ABC ABC "



-- Compare duplicate to duplicate':


duplicate' :: String -> Integer -> String
duplicate' string repetitions

 =  [ character | character  <- string , repetition <- [1 .. repetitions] ]


{- GHCi>

duplicate' "ABC " 1
duplicate' "ABC " 2
duplicate' "ABC " 3

-}
-- "ABC "
-- "AABBCC  "
-- "AAABBBCCC   "



-- If you think of this list comprehension in terms of a loop,
-- procedural pseudo code would probably look like this:
--
--
--   Define a list.
--
--   for each character of string do
--   {
--     for each repetition of repetitions do
--     {
--       put character in the list
--     }
--   }
--
-- The rightmost generator transforms to the innermost loop.
-- 
-- Consider:
-- GHCi> 
{- 
   let characterDuplicate string times = [ character | character <- string, trash <- [1 .. times]]
   let cd = characterDuplicate
   cd "A" 2
   cd "AB" 2
-}


-- Other solution for "duplicate":


duplicate'2 :: String -> Integer -> String
duplicate'2 s n

 |  n == 0     = ""
 |  otherwise  = s ++ ( duplicate'2 s (n - 1) )




