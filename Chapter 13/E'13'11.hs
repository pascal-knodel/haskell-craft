--
--
--
------------------
-- Exercise 13.11.
------------------
--
--
--
module E'13'11 where



import Prelude hiding
 (
   length
 )

import Data.List
 (
   foldl'
 )




showBoolFun :: (Bool -> Bool) -> String
showBoolFun b

 =      " v     | b(v)  \n"
    ++  "---------------\n"
    ++  " True  | " ++ (show $ b True )  ++ "\n"
	++  " False | " ++ (show $ b False) ++ "\n"


-- GHCi> putStr $ "\n" ++ showBoolFun not ++ "\n"
-- 
--  v     | b(v)
-- ---------------
--  True  | False
--  False | True



showBoolFunGen :: (a -> String) -> (Bool -> a) -> String
showBoolFunGen f b

 =      " v | b(v)  \n"
    ++  "----------\n"
    ++  " T | " ++ (f . b) True  ++ "\n"
	++  " F | " ++ (f . b) False ++ "\n"


{- GHCi> 

let f :: Bool -> String ; f True = "T" ; f False = "F"
let b :: Bool -> Bool   ; b = not

putStr $ "\n" ++ showBoolFunGen f b ++ "\n"

-}
-- 
--  v | b(v)
-- ----------
--  T | F
--  F | T



-- How would you extend your answer to deal with multiple-argument Boolean functions?
-------------------------------------------------------------------------------------


-- Contract: please supply the multi argument boolean function as "([Bool] -> Bool)".

-- "tt" truth table (of ...)
tt :: ([Bool] -> Bool) -> String -> Integer -> String
tt function name numberOfArguments

 =      header
    ++  separation
	++  table

 where
 
 argumentIndexes :: [Integer]
 argumentIndexes =  [1 .. numberOfArguments]
 
 header :: String
 header =      ' ' : (  concat . map ( \argumentIndex -> 'a' : (show argumentIndex) ++ " " )   ) argumentIndexes
           ++  "| " ++ name ++ "\n"

 separation :: String
 separation =  [ '-' | _ <- [1 .. (length header)] ] ++ "\n"

 permutationIndexes :: [Integer]
 permutationIndexes =  [0 .. (2 ^ numberOfArguments - 1)]
 
 functionArguments :: [[Bool]]
 functionArguments =  map (adjust numberOfArguments) $ map (map toBool) ( map remainders permutationIndexes )
 
 table :: String
 table = concat [ concat [ [ ' ' , shorten argument , ' ' ] | argument <- arguments ] ++ " | " ++ [(shorten $ function arguments)] ++ "\n" | arguments <- functionArguments ]
 
--

length :: [a] -> Integer
length =  foldl' (\a b -> a + 1) 0

remainders :: Integer -> [Integer]
remainders i = remainders' i []

remainders' :: Integer -> [Integer] -> [Integer]
remainders' 0 a =  a
remainders' i a =  remainders' (i `div` 2) (i `rem` 2  : a)

toBool :: Integer -> Bool
toBool 0 =  False
toBool 1 =  True
toBool _ =  error "Integer out of range [ 0 , 1 ]."

shorten :: Bool -> Char
shorten True  = 'T'
shorten False = 'F'
 
adjust :: Integer -> [Bool] -> [Bool]   -- 'pad with "False"'
adjust numberOfArguments arguments = [ False | _ <- [1 .. (numberOfArguments - length arguments)] ] ++ arguments
 
 

-- Examples:

logical_and :: [Bool] -> Bool
logical_and arguments |  length arguments < 2  = error "Insufficient arguments."
logical_and arguments =  (&&) ( arguments !! (1 - 1) ) ( arguments !! (2 - 1) )


-- GHCi> putStr $ "\n" ++ tt logical_and "logical_and" 2 ++ "\n"
-- 
--  a1 a2 | logical_and
-- ---------------------
--  F  F  | F
--  F  T  | F
--  T  F  | F
--  T  T  | T



logical_and_or :: [Bool] -> Bool
logical_and_or arguments |  length arguments < 3  = error "Insufficient arguments."
logical_and_or arguments =  ( arguments !! (1 - 1) ) && ( arguments !! (2 - 1) ) || ( arguments !! (3 - 1) )


-- GHCi> putStr $ "\n" ++ tt logical_and_or "logical_and_or" 3 ++ "\n"
-- 
--  a1 a2 a3 | logical_and_or
-- ---------------------------
--  F  F  F  | F
--  F  F  T  | T
--  F  T  F  | F
--  F  T  T  | T
--  T  F  F  | F
--  T  F  T  | T
--  T  T  F  | T
--  T  T  T  | T




