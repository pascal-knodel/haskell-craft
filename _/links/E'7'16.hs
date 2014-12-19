--
--
--
-----------------
-- Exercise 7.16.
-----------------
--
--
--
module E'7'16 where




-- Sorting in descending order:


iSort' :: [Integer] -> [Integer]
iSort' [] = []
iSort' ( integer : remainingIntegers )

 =  ins' integer (iSort' remainingIntegers)
 

ins' :: Integer -> [Integer] -> [Integer]
ins' integer [] = [integer]
ins' integer ( listInteger : remainingListIntegers )
 
 |  integer > listInteger  = integer : (listInteger : remainingListIntegers)
 |  otherwise              = listInteger : (ins' integer remainingListIntegers)

 
{- GHCi>

let set :: [Integer] ; set = [1, 1, 2, 2, 3, 3]

iSort'  set

-}
-- [ 3 , 3 , 2 , 2 , 1 , 1 ]



-- Sorting and removing duplicates:


iSort'' :: [Integer] -> [Integer]
iSort'' [] = []
iSort'' ( integer : remainingIntegers )

 =  ins'' integer (iSort'' remainingIntegers)
 

ins'' :: Integer -> [Integer] -> [Integer]
ins'' integer [] = [ integer ]
ins'' integer ( listInteger : remainingListIntegers )
 
 |  integer < listInteger  = integer : (listInteger : remainingListIntegers)
 |  integer > listInteger  = listInteger : (ins'' integer remainingListIntegers)         
 |  otherwise              = listInteger : remainingListIntegers


{- GHCi>

let set :: [Integer] ; set = [1, 1, 2, 2, 3, 3]

iSort'' set

-}
-- [ 1 , 2 , 3 ]




