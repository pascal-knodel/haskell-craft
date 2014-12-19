--
--
--
-----------------
-- Exercise 10.3.
-----------------
--
--
--
module E'10''3 where



import Test.QuickCheck ( quickCheck )




-- GHCi> :t addUp
-- (Num a, Ord a) => [a] -> [a]



-- Definition from the text:


addUp :: ( Num t , Ord t ) => [t] -> [t]
addUp ns

 = filter greaterOne ( map addOne ns )

 where
 
 greaterOne :: ( Num t , Ord t ) => t -> Bool
 greaterOne number = number > 1

 addOne :: ( Num t , Ord t ) => t -> t
 addOne number = number + 1


-- ...



-- No redefinition:


addUpWrong :: ( Num t , Ord t ) => [t] -> [t]
addUpWrong numbers

 = map addOne (filter greaterOne numbers)
 
 where
 
 greaterOne :: ( Num t , Ord t ) => t -> Bool
 greaterOne number = number > 1

 addOne :: ( Num t , Ord t ) => t -> t
 addOne number = number + 1


{- GHCi>

:{
   let numbers :: [Integer] ;
       numbers = [ 1 , 2 ]
:}

addUp      numbers
addUpWrong numbers

-}
-- [ 2 , 3 ]
-- [ 3 ]



-- Redefinition:


addUp' :: ( Num t , Ord t ) => [t] -> [t]
addUp' numbers

 = map addOne (filter greaterOrEqualOne numbers)

 where
 
 greaterOrEqualOne :: ( Num t , Ord t ) => t -> Bool
 greaterOrEqualOne number = number >= 1
 
 addOne :: ( Num t , Ord t ) => t -> t
 addOne number = number + 1


{- GHCi>

:{
   let numbers :: [Integer] ;
       numbers = [ 1 , 2 ]
:}

addUp  numbers
addUp' numbers

-}
-- [ 2 , 3 ]
-- [ 2 , 3 ]




prop_addUp :: [Integer] -> Bool
prop_addUp numbers

 = addUp' numbers == addUp numbers


-- GHCi> quickCheck prop_addUp




