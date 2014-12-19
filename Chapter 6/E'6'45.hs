--
--
--
-----------------
-- Exercise 6.45.
-----------------
--
--
--
module E'6'45 where



import B'C'6
 (
   Database
 , BarCode
 , Name
 , Price
 )




look :: Database -> BarCode -> (Name, Price)
look database indexBarCode

 |  searchResult == []  = ( "Unknown Item" , 0 )
 |  otherwise           = head searchResult
 
 where
 
 searchResult :: [ (Name, Price) ]
 searchResult =  [ (name , price) | (barCode , name , price) <- database , barCode == indexBarCode ]


{- GHCi>

look codeIndex 4719

-}
-- ( "Fish Fingers", 121 )




