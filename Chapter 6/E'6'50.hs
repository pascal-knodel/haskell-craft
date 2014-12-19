--
--
--
-----------------
-- Exercise 6.50.
-----------------
--
--
--
module E'6'50 where



import B'C'6
 (
   Name
 , Price
 , TillType
 , BillType
 , lineLength
 )

import E'6'39 ( formatPence )
import E'6'40 ( formatLine )
import E'6'41 ( formatLines )
import E'6'42 ( makeTotal )
import E'6'43 ( formatTotal )
import E'6'44 ( formatTitle )
import E'6'46 ( lookup )
import E'6'48
 (
   makeDiscount
 , formatDiscount
 )

import Prelude hiding ( lookup )

import Data.List ( concat )




-- "Keep the function makeBill as it is, and modify the formatting functions"

formatLine' :: (Name, Price) -> String
formatLine' ( "Unknown Item" , 0 ) =  []
formatLine' (name , price)

 =  name ++ dots ++ formattedPrice ++ "\n"
 
 where
 
 formattedPrice :: String
 formattedPrice =  formatPence price
 
 nonFillCharacterCount :: Int
 nonFillCharacterCount =  (length name) + (length formattedPrice)   -- Definition: "\n" (white space) doesn't count.
 
 numberOfDots :: Int
 numberOfDots =  lineLength - nonFillCharacterCount
 
 dots :: String
 dots =  replicate numberOfDots '.'


formatLines' :: [ (Name, Price) ] -> String
formatLines' namePricePairs

 =  concat (map formatLine' namePricePairs)


formatBill'' :: BillType -> String
formatBill'' bill

 =      (formatTitle "Haskell Stores")
    ++  (formatLines' bill)
    ++  (formatDiscount discount)
    ++  (formatTotal total)
   
 where
 
 discount :: Int
 discount =  makeDiscount bill
 
 total :: Int
 total =  (makeTotal bill) - discount



-- "modify the makeBill function to remove the 'unknown item' pairs"

makeBill' :: TillType -> BillType
makeBill' tillType

 =  knownItems
 
 where
 
 knownItems :: BillType
 knownItems =  [ item | item <- allItems , item /= ( "Unknown Item" , 0 ) ]

 allItems :: BillType
 allItems =  map lookup tillType




