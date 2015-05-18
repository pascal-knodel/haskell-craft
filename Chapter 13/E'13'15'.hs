--
--
--
------------------
-- Exercise 13.15.
------------------
--
--
--
module E'13'15' where



-- Note: > cabal install roman-numerals

import qualified Text.Numeral.Roman
 (
   toRoman
 )



-- Defining a tail recursive conversion function between arabic and roman numbers.




-- 1. Tail recursive patterns:
------------------------------


type Digit = Int
type Position = Int
type Number = Int
type RomanNumber = [Char]
type Digits = [Char]
type DigitAccumulator = [Char]


t :: Number -> RomanNumber
t n

 |  n > 3999   = error "`toRoman'´ is not defined for values greater than `3999´."
 |  otherwise  = t' (n `div` 10) (n `mod` 10) 0 ""
 
 where
 
 ds :: Digits
 ds = "IVXLCDM"
 --    0123456   (indexes)
 --    0 1 2 3   (positions)
 
 t' :: Number -> Digit -> Position -> DigitAccumulator -> RomanNumber
 
 t' _ d 3 a =  replicate d 'M' ++ a
 
 -- Covering IX, XC, CM:
 --                                                   subtrahend         : minuend 
 t' n 9 p a =  t' (n `div` 10) (n `mod` 10) (p + 1) ( ( ds !!  (p * 2) ) : ( ds !! ( (p + 1) * 2 ) ) : a )
 
 -- Covering IV, XL, CD:
 --                                                   subtrahend         : minuend
 t' n 4 p a =  t' (n `div` 10) (n `mod` 10) (p + 1) ( ( ds !!  (p * 2) ) : ( ds !! (p * 2 + 1) ) : a)

 -- Other:
 --                                                five * 10^p                                      one * 10^p
 t' n d p a = t' (n `div` 10) (n `mod` 10) (p + 1) ( replicate (d `div` 5) ( ds !! (p * 2 + 1) ) ++ ( replicate (d `mod` 5) ( ds !! (p * 2) ) ) ++ a )


-- Test:


test_t :: IO ()
test_t

 =  test_t' 1
 
 where
 
 test_t' :: Integer -> IO ()
 test_t' 4000 =  do putStr "Successfully converted numbers from 1 to 3999 to roman numbers.\n"
                    return ()
 test_t' number
 
   =  do putStr (
                       (Text.Numeral.Roman.toRoman number :: String)
                   ++  " =?= "
			       ++  t (fromInteger number)
				   ++  "\n"
				   ++  if ( Text.Numeral.Roman.toRoman number == t (fromInteger number) ) then ("") else (error "<-- conversion error")
			    )
			   
         test_t' (number + 1)
 



-- 2. Tail recursive pattern:
-----------------------------



toRoman' :: Int -> [Char]
toRoman' n

 |  n > 3999   = error "`toRoman'´ is not defined for values greater than `3999´."
 |  otherwise  = toRoman (n `div` 10) (n `mod` 10) 0 ""
 
 where
 
 ds :: Digits
 ds = "IVXLCDM"
 
 toRoman :: Int -> Int -> Int -> [Char] -> [Char]
 toRoman _ d 3 a =  replicate d 'M'  ++  a
 toRoman n d p a =  toRoman (n `div` 10) (n `mod` 10) (p + 1) ( 
                                                                 case  d  of  { 
																	             9  ->  ds !! (p * 2)  :  ds !! ( (p + 1) * 2 )  :  a    ;
													                             4  ->  ds !! (p * 2)  :  ds !! ( p * 2 + 1   )  :  a    ;
																	             _  ->      replicate (d `div` 5) ( ds !! (p * 2 + 1) )
																	                    ++  replicate (d `mod` 5) ( ds !! (p * 2) )
																			            ++  a
																	          }
                                                              )




