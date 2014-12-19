--
--
--
-----------------
-- Exercise 6.41.
-----------------
--
--
--
module E'6'41 where



import B'C'6
 (
   Name
 , Price
 )

import E'6'40 ( formatLine )

import Data.List ( concat )




formatLines :: [ (Name, Price) ] -> String
formatLines namePricePairs

 =  concat (map formatLine namePricePairs)




