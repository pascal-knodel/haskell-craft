--
--
--
-----------------
-- Exercise 6.42.
-----------------
--
--
--
module E'6'42 where



import B'C'6
 (
   Price
 , BillType
 )

import  Data.List ( sum )




makeTotal :: BillType -> Price
makeTotal namePricePairs

 =  sum (map snd namePricePairs)




-- Other solutions for "makeTotal":



makeTotal' :: BillType -> Price
makeTotal' namePricePairs

 =  sum [ price | ( _ , price ) <- namePricePairs ]

 

makeTotal'' :: BillType -> Price
makeTotal'' [] =  0
makeTotal'' ( ( _ , price ) : namePricePairs ) =  price + (makeTotal'' namePricePairs)




