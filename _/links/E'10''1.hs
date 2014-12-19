--
--
--
-----------------
-- Exercise 10.1.
-----------------
--
--
--
module E'10''1 where




-- List comprehension:
-- -------------------


doubleAll :: [Integer] -> [Integer]
doubleAll integerList

 = [ integer * 2 | integer <- integerList ]


--    doubleAll [ 2 , 1 , 7 ]
-- ~> [ integer * 2 | integer <- [ 2 , 1 ,  7 ] ]
--
--      integer                    2   1    7
--      integer * 2                4   2   14
--
-- ~>                            [ 4 , 2 , 14 ]



-- Primitive recursion:
-- --------------------


doubleAll' :: [Integer] -> [Integer]
doubleAll' [] = []
doubleAll' (integer : remainingIntegers)

 = integer * 2 : doubleAll remainingIntegers


--    doubleAll' [ 2 , 1 , 7 ]
-- ~> doubleAll' ( 2 : [ 1 , 7 ] )
-- ~> ( 2 * 2 ) : doubleAll' [ 1 , 7 ]
-- ~> 4 : doubleAll' [ 1 , 7 ]
-- ~> 4 : doubleAll' ( 1 : [ 7 ] )
-- ~> 4 : ( 1 * 2 ) : doubleAll' [ 7 ]
-- ~> 4 : 2 : doubleAll' [ 7 ]
-- ~> 4 : 2 : doubleAll' ( 7 : [] )
-- ~> 4 : 2 : ( 7 * 2 ) : doubleAll' []
-- ~> 4 : 2 : 14 : doubleAll' []
-- ~> 4 : 2 : 14 : []
-- ~> [ 4 , 2 , 14 ]



-- Map:
-- ----


doubleAll'' :: [Integer] -> [Integer]
doubleAll'' integerList

 = map double integerList
 
 where
 
 double :: Integer -> Integer
 double integer = integer * 2


--    doubleAll'' [ 2 , 1 , 7 ]
-- ~> map double [ 2 , 1 , 7 ]
-- ~> ( double 2 ) : map double [ 1 , 7 ]
-- ~> ( 2 * 2 ) : map double [ 1 , 7 ]
-- ~> 4 : map double [ 1 , 7 ]
-- ~> 4 : ( double 1 ) : map double [ 7 ]
-- ~> 4 : ( 1 * 2 ) : map double [ 7 ]
-- ~> 4 : 2 : map double [ 7 ]
-- ~> 4 : 2 : ( double 7 ) : map double []
-- ~> 4 : 2 : ( 7 * 2 ) : map double []
-- ~> 4 : 2 : 14 : map double []
-- ~> 4 : 2 : 14 : []
-- ~> [ 4 , 2 , 14 ]




{- GHCi>


:{
   let numbers :: [Integer] ;
       numbers = [ 2 , 1 , 7 ]
:}

doubleAll   numbers
doubleAll'  numbers
doubleAll'' numbers


-}
-- [ 4 , 2 , 14 ]
-- [ 4 , 2 , 14 ]
-- [ 4 , 2 , 14 ]




