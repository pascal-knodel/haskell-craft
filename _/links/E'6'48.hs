--
--
--
-----------------
-- Exercise 6.48.
-----------------
--
--
--
module E'6'48 where



import B'C'6
 (
   BillType
 , Price
 )

import E'6'40 ( formatLine )
import E'6'41 ( formatLines )
import E'6'42 ( makeTotal )
import E'6'43 ( formatTotal )
import E'6'44 ( formatTitle )




makeDiscount :: BillType -> Price
makeDiscount bill

 =  ( (countRelatedProducts bill) `div` 2 ) * 100
 
 where
 
 countRelatedProducts :: BillType -> Int
 countRelatedProducts []                 =  0
 countRelatedProducts (  (name , _ ) : bill  )
 
  |  name == "Dry Sherry, 1lt"   = 1 + (countRelatedProducts bill)
  |  otherwise                   =      countRelatedProducts bill
 
 
formatDiscount :: Price -> String
formatDiscount price

 =  "\n" ++ ( formatLine ("Discount", price) )
 
 
formatBill' :: BillType -> String
formatBill' bill

 =      (formatTitle "Haskell Stores")
    ++  (formatLines bill)
    ++  (formatDiscount discount)
    ++  (formatTotal total)
   
 where
 
 discount :: Int
 discount =  makeDiscount bill
 
 total :: Int
 total =  (makeTotal bill) - discount
 
 
{- GHCi>

:{
   putStr (
            formatBill' [ 
                          ( "Dry Sherry, 1lt"    , 540 ) ,
                          ( "Fish Fingers"       , 121 ) ,
                          ( "Orange Jelly"       ,  56 ) ,
                          ( "Hula Hoops (Giant)" , 133 ) ,
                          ( "Unknown Item"       ,   0 ) ,
                          ( "Dry Sherry, 1lt"    , 540 )
                        ]
          )
:}

-}
-- 
--         Haskell Stores
-- 
-- Dry Sherry, 1lt...........5.40
-- Fish Fingers..............1.21
-- Orange Jelly..............0.56
-- Hula Hoops (Giant)........1.33
-- Unknown Item..............0.00
-- Dry Sherry, 1lt...........5.40
-- 
-- Discount..................1.00
-- 
-- Total....................12.90




