--
--
--
-----------------
-- Exercise 6.46.
-----------------
--
--
--
module E'6'46 where



import B'C'6
 (
   BarCode
 , Name
 , Price
 , codeIndex
 )

import E'6'45 ( look )

import Prelude hiding ( lookup )




lookup :: BarCode -> (Name, Price)   -- Note: import Prelude hiding ( lookup )
lookup barCode

 =  look codeIndex barCode


{- GHCi>

lookup (-1)
lookup 1111

-}
-- ( "Unknown Item" , 0 )
-- ( "Hula Hoops"   , 21 )




