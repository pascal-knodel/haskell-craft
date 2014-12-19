--
--
--
-----------------
-- Exercise 6.47.
-----------------
--
--
--
module E'6'47 where



import B'C'6
 (
   TillType
 , BillType
 )

import E'6'46 ( lookup )

import Prelude hiding ( lookup )




makeBill :: TillType -> BillType
makeBill tillType

 =  map lookup tillType




-- Other solution for "makeBill":



makeBill' :: TillType -> BillType
makeBill' tillType

 =  [ lookup barCode | barCode <- tillType ]




