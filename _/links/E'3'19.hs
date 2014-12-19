--
--
--
-----------------
-- Exercise 3.19.
-----------------
--
--
--
module E'3'19 where




romanDigit :: Char -> String
romanDigit aChar

 |  '1' == aChar  = "I"
 |  '2' == aChar  = "II"
 |  '3' == aChar  = "III"
 |  '4' == aChar  = "IV"
 |  '5' == aChar  = "V"
 |  '6' == aChar  = "VI"
 |  '7' == aChar  = "VII"
 |  '8' == aChar  = "VIII"
 |  '9' == aChar  = "IX"
 |  otherwise     = error "Characters that don't represent a number from 1 to 10\
                          \can't be expressed in Roman numerals."




