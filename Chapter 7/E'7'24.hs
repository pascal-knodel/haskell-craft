--
--
--
-----------------
-- Exercise 7.24.
-----------------
--
--
--
module E'7'24 where



-- Subchapter 7.5, example 3:


qSort :: [Integer] -> [Integer]
qSort [] = []
qSort ( pivot : list )

 =  qSort lesserThanPivot ++ [pivot] ++ qSort greaterThanOrEqualToPivot
   
 where
 
 lesserThanPivot :: [Integer]
 lesserThanPivot =  [ item | item <- list , item < pivot ]
 
 greaterThanOrEqualToPivot :: [Integer]
 greaterThanOrEqualToPivot =  [ item | item <- list , item >= pivot ]


-- ...



-- Sorting in descending order:

qSort' :: [Integer] -> [Integer]
qSort' [] = []
qSort' ( pivot : list )

 =  qSort' greaterThanOrEqualToPivot ++ [pivot] ++ qSort' lesserThanPivot
   
 where
 
 lesserThanPivot :: [Integer]
 lesserThanPivot =  [ item | item <- list , item < pivot ]
 
 greaterThanOrEqualToPivot :: [Integer]
 greaterThanOrEqualToPivot =  [ item | item <- list , item >= pivot ]


 
-- Sorting and removing duplicates:

qSort'' :: [Integer] -> [Integer]
qSort'' [] = []
qSort'' ( pivot : list )

 =  qSort'' lesserThanPivot ++ [pivot] ++ qSort'' greaterThanOrEqualToPivot
   
 where
 
 lesserThanPivot :: [Integer]
 lesserThanPivot =  [ item | item <- list , item < pivot ]
 
 greaterThanOrEqualToPivot :: [Integer]
 greaterThanOrEqualToPivot =  [ item | item <- list , item > pivot ]




