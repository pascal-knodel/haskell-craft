--
--
--
----------------
-- Exercise 7.6.
----------------
--
--
--
module E'7''6 where



import Prelude hiding ( and , or )




and, or :: [Bool] -> Bool


and [] = True
and ( booleanValue : remainingBooleanValues )

 =  booleanValue && (and remainingBooleanValues)


or [] = False
or ( booleanValue : remainingBooleanValues )

 =  booleanValue || (or remainingBooleanValues)




