--
--
--
-----------------
-- Exercise 7.34.
-----------------
--
--
--
module E'7'34 where



import Data.List ( isPrefixOf , drop )




subst :: String -> String -> String -> String
subst "" _ string = string
subst _ _ "" = ""
subst oldSubstring newSubstring string@( stringCharacter : remainingStringCharacters )

 |  isPrefixOf oldSubstring string  = newSubstring ++ (drop (length oldSubstring) string)
 |  otherwise                       = stringCharacter : subst oldSubstring newSubstring remainingStringCharacters


{- GHCi>

subst "much " "tall " "How much is that?"

-}
-- "How tall is that?"




