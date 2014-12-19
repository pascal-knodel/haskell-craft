--
--
--
-----------------
-- Exercise 11.1.
-----------------
--
--
--
module E'11''1 where



import B'C'11 ( (>.>) )


-- import C'6


-- Note: Chapter 6> cabal install

import B'C'6 (TillType)
import E'6'44 (formatBill)
import E'6'47 (makeBill)




-- Note: If your book says "printBill" - that's a mistake,
--       the function name is "produceBill" (see subchapter 6.7).



produceBill :: TillType -> String
produceBill =  formatBill . makeBill


{- GHCi>

putStr ( produceBill [ 3814 , 1234 ] )

-}
--
--         Haskell Stores
-- 
-- Orange Jelly..............0.56
-- Dry Sherry, 1lt...........5.40
-- 
-- Total.....................5.96


-- ...



produceBill' :: TillType -> String
produceBill' tillType =  formatBill ( makeBill tillType )


produceBill'' :: TillType -> String
produceBill'' =  makeBill >.> formatBill




