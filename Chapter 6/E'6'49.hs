--
--
--
-----------------
-- Exercise 6.49.
-----------------
--
--
--
module E'6'49 where



import B'C'6
 (
   Database
 , BarCode
 , Name
 , Price
 )




update :: Database -> (BarCode, Name, Price) -> Database
update database ( barCode , name , price )

 =  add (remove database barCode) (barCode , name , price)
 

remove :: Database -> BarCode -> Database
remove database indexBarCode

 =  [ (barCode , name , price) | (barCode , name , price) <- database , barCode /= indexBarCode ]


add :: Database -> (BarCode, Name, Price) -> Database
add database record

 =  record : database




