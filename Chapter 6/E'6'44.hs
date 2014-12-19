--
--
--
-----------------
-- Exercise 6.44.
-----------------
--
--
--
module E'6'44 where



import B'C'6
 (
   BillType
 , lineLength
 )

import E'6'41 ( formatLines )
import E'6'42 ( makeTotal )
import E'6'43 ( formatTotal )




formatBill :: BillType -> String
formatBill namePricePairs

 =      ( formatTitle "Haskell Stores" )
    ++  ( formatLines namePricePairs )
    ++  ( formatTotal (makeTotal namePricePairs) )

   
formatTitle :: String -> String
formatTitle title

 =  "\n" ++ (center title lineLength) ++ "\n\n"


type LineLength =  Int

center :: String -> LineLength -> String
center string lineLength

 =  blanksLeft ++ string ++ blanksRight
 
 where
 
 blanksCount :: Int
 blanksCount =  lineLength - (length string)
 
 numberOfBlanksLeft, numberOfBlanksRight :: Int
 
 numberOfBlanksLeft  =  blanksCount `div` 2
 numberOfBlanksRight =  blanksCount - numberOfBlanksLeft
 
 blanksLeft, blanksRight :: String
 
 blanksLeft  =  replicate numberOfBlanksLeft  ' '
 blanksRight =  replicate numberOfBlanksRight ' '


{- GHCi>

:{
   putStr (
            formatBill [ 
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
-- Total....................13.90




