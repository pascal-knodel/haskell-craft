--
--
--
-----------------
-- Exercise 6.40.
-----------------
--
--
--
module E'6'40 where



import B'C'6
 (
   Name
 , Price
 , lineLength
 )

import E'6'39 ( formatPence )




formatLine :: (Name, Price) -> String
formatLine (name , price)

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




