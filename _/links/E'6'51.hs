--
--
--
-----------------
-- Exercise 6.51.
-----------------
--
--
--
module E'6'51 where



import B'C'6 ( Price )

import E'6'39 ( formatPence )




-- "How appropriate would it be to test your supermarket billing system using QuickCheck?"
--
-- It would help. Unit tests would be the better choice though.
--
-- Example: formatPence
--
-- We might use quick check:
--
-- Things to test: 
--
-- - Formatting of negative numbers if you allow them (I didn't, see ex. 6.39).
-- - Positive numbers with one digit have to be formatted "0.0X", with two digits: "0.XX".
-- - Positive numbers with more than two digits have to be of length (Int-length + 1).
--   Int-length is the number of digits of the Int, 1 is the length of the separator ".".
--
-- Problem: We might use preconditions, but results wouldn't be pleasing ("gave up" messages). 
--          We might force the values in the range we need them to be by applying further definitions/calculations.
--          We yet don't know nothing about how to use quick check to generate values in range 100 to MAX_INT, ...


prop_formatPence :: Price -> Bool
prop_formatPence price

 =  ( length (formatPence price') ) == ( (intLength price') + 1 )
   
 where

 price' :: Int
 price'
 
  |  price <   0 =  -price + 100
  |  price < 100 =   price + 100
  |  otherwise   =   price
 
 intLength :: Int -> Int
 intLength int =  length (show int)


-- Isn't written well, because we lack knowledge about how to use QuickCheck2 appropriate.
--
-- GHCi> quickCheck prop_formatPence


-- It is appropriate, because: testing only shows the presence of errors, not their absence!
-- Maybe it shows errors we would have forgotten otherwise and helps improving the system.
--
-- Unit testing covers the cases for formatPence better. The cases are well known - if we've checked 
-- one n-digit number, there is no need to check another one - and 100 random generated test values 
-- will definitely (32-Bit Integer: -2,147,483,648 to 2,147,483,647) produce integers of equal length. 
-- Main test cases are natural numbers with one, two and three digits. I think unit testing would be
-- the better choice for the remaining functions as well.

-- ...




