--
--
--
-----------------
-- Exercise 5.24.
-----------------
--
--
--
module E'5'24 where



pushRight :: String -> Integer -> String
pushRight string lineLength

 =      [ ' ' | currentLength <- [1 .. blankCount] ]
    ++  string

 where
 
 blankCount :: Integer
 blankCount =  lineLength - (toInteger (length string))


{-

pushRight "##" 1
pushRight "##" 2
pushRight "##" 3
pushRight "##" 4

-}
-- "##"
-- "##"
-- " ##"
-- "  ##"



-- Other solutions for "pushRight":


-- Just for fun and because the length function wasn't hinted in the book yet.

pushRight' :: String -> Integer -> String
pushRight' string lineLength

 |      lineLength < 0
    ||  string == [ character | currentLength <- [1 .. (lineLength - 1)], 
                                character <- string                       ]  = string
 |  otherwise                                                                = " " ++ (pushRight string (lineLength - 1))

-- Q: What are the disadvantages of this?
-- A: Harder to read, ...



pushRight'3 :: String -> Int -> String
pushRight'3 string lineLength

 =      (  replicate ( lineLength - (length string) ) ' '  )
    ++  string




