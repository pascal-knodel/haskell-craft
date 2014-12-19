-- (Chapter 11)
module E27 where



f :: Integer -> Integer
f i =  i


f' :: Integer -> Integer
f' i =  i


ff' :: Integer -> Integer
ff' i =  f . f' i



-- Possible correction:
{-


f :: Integer -> Integer
f i =  i


f' :: Integer -> Integer
f' i =  i


ff' :: Integer -> Integer
ff' i =  ( f . f' ) i

 
-}




