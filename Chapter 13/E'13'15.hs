-- {-# OPTIONS_GHC -XInstanceSigs #-}   -- This flag allows 'Instance Signatures'.
--
--
--
------------------
-- Exercise 13.15.
------------------
--
--
--
module E'13'15 where



-- Note: I will write a function that converts integers in [1, 3999] to
--       'Modern Roman Number Notation'. There are a variety of notations:
--       'Simple Roman Number Notation' and 'Infinite Roman Number Notation's.
--       You have to do research on your own because the exercise text doesn't
--       say anything about the desired format.



-- Note: > cabal install roman-numerals

import qualified Text.Numeral.Roman
 (
   toRoman
 )




data Roman =  Roman Integer

-- Note: It is no restriction to use an "Int"-type because the range for 
--       roman numbers with basic symbols is only [1, 3999]. So we don't need
--       "Integer"s. This clue is helpful if we don't want to convert "fromInteger"
--       all the time (if we choose to use standard functions from "Prelude" which expect
--       "Int" arguments). Instead we use "Int"s and convert the result to an "Integer" last.



instance  Num Roman  where

  ----------------------------------
  -- (+) :: Roman -> Roman -> Roman
  ----------------------------------
  -- (*) :: Roman -> Roman -> Roman
  ----------------------------------
  -- abs :: Roman -> Roman
  ----------------------------------
  -- signum :: Roman -> Roman
  ----------------------------------
  -- fromInteger :: Integer -> Roman
  ----------------------------------
  -- negate :: Roman -> Roman
  ----------------------------------

  (+) (Roman i_1) (Roman i_2) =  Roman (i_1 + i_2)
  (*) (Roman i_1) (Roman i_2) =  Roman (i_1 * i_2)
  
  fromInteger    i =  Roman i
  
  abs     =  id
  signum  =  error "Roman numbers aren't signed."
  negate (Roman i) =  Roman (-i)   -- It is actually a good idea to have negative numbers internally.
  


instance  Show Roman  where

  --------------------------
  -- show :: Roman -> String
  --------------------------
  
  show (Roman number) =  toRoman (fromInteger number)



-- It should be easy to give an accumulative definition of the conversion between
-- our positional notation of numbers and roman numbers in the interval [1, 3999] too.


toRoman :: Int -> [Char]
toRoman n

 |  0 > n  ||  n > 3999   = error "\"toRoman\"/\"show\" is not defined for values out of range [1, 3999]."
 |  otherwise             = toRoman (n `div` 10) (n `mod` 10) 0 ""
 
 where
 
 ds :: [Char]
 ds = "IVXLCDM"
 
 toRoman :: Int -> Int -> Int -> [Char] -> [Char]
 toRoman _ d 3 a =  replicate d 'M'  ++  a
 toRoman n d p a =  toRoman (n `div` 10) (n `mod` 10) (p + 1) (convert d p a)
 
 convert :: Int -> Int -> [Char] -> [Char]
 convert d p a
 
  =  case  d  of  9  ->  ds !! (p * 2)  :  ds !! ( (p + 1) * 2 )  :  a    ;
                  4  ->  ds !! (p * 2)  :  ds !! ( p * 2 + 1   )  :  a    ;
                  _  ->      replicate (d `div` 5) ( ds !! (p * 2 + 1) )
                         ++  replicate (d `mod` 5) ( ds !! (p * 2) )
                         ++  a


test_toRoman :: IO ()
test_toRoman

 =  test_toRoman' 1
 
 where
 
 test_toRoman' :: Integer -> IO ()
 test_toRoman' 4000 =  do putStr "\nSuccessfully converted 1 to 3999 to roman numbers.\n\n"
                          return ()
 test_toRoman' n
 
   =  if    ( Text.Numeral.Roman.toRoman n == toRoman (fromInteger n) )
   
      then  do putStr (
                             (Text.Numeral.Roman.toRoman n :: String)
                         ++  " == "
			             ++  toRoman (fromInteger n)
				         ++  "\n"
			          )   
               test_toRoman' (n + 1)
			
	  else  error ("\nConversion failed on" ++ show n ++ ".\n\n")


-- Note: In general, testing against a library is not enough. Write/Use a grammar and test against rules instead.



-- GHCi> :t ((+) :: Roman -> Roman -> Roman)
-- ((+) :: Roman -> Roman -> Roman) :: Roman -> Roman -> Roman


-- GHCi> Roman 1000 + Roman 999
-- MCMXCIX


-- GHCi> Roman 4000
-- *** Exception: "toRoman"/"show" is not defined for values out of range [1, 3999].


-- GHCi> Roman 4000 - Roman 3999
-- I


-- GHCi> Roman 4000 - Roman 4001
-- *** Exception: "toRoman"/"show" is not defined for values out of range [1, 3999].



-- Create a space seperated values list with roman numbers from 1 to 3999
-- - this is our algorithm compressed to a table:
--
{- GHCi>


:{

let ssv :: Integer -> String
    ssv 3999 =  "3999 " ++ show (Roman 3999)
    ssv v    =  show v ++ " " ++ show (Roman v) ++ "\n" ++ ssv (v + 1)

:}

writeFile "./roman_numbers_1_to_3999.txt" (ssv 1)


-} 




-- Other solutions for "toRoman":



toRoman' :: Integer -> [Char]
toRoman' n

 |  0 > n  ||  n > 3999   = error "\"toRoman\"/\"show\" is not defined for values out of range [1, 3999]."
 |  otherwise             = toRoman' n
 
 where
 
 toRoman'' :: Integer -> [Char]
 toRoman'' n
 
         -- n of Ms, Ds, Cs, Ls, Xs, Vs and Is:
  =  let  ms =  n            `div` 1000  
          ds =  n `mod` 1000 `div`  500  ;
		  cs =  n `mod`  500 `div`  100  ;
          ls =  n `mod`  100 `div`   50  ;
          xs =  n `mod`   50 `div`   10  ;
          vs =  n `mod`   10 `div`    5  ;
          is =  n `mod`    5
			 
     in      ms `times` 'M'
	   
	     ++  case  n `mod` 1000 - n `mod` 100  of  900  ->  "CM"  ;
			                                       400  ->  "CD"  ;
			                                       _    ->  ds `times` 'D'  ++  cs `times` 'C'
						  
		 ++  case  n `mod` 100 - n `mod` 10  of  90  ->  "XC"  ;
			                                     40  ->  "XL"  ;
			                                     _   ->  ls `times` 'L'  ++  xs `times` 'X'
			     
         ++  case  n `mod` 10  of  9  ->  "IX"  ;
			                       4  ->  "IV"  ;
				                   _  ->  vs `times` 'V'  ++  is `times` 'I'


times :: Integer -> a -> [a]
times t a = [ a | _ <- [1 .. t] ]


-- Note, above: Low level solution.


 

-- It should be easy to give a 'point-free' definition of the conversion between
-- our positional notation of numbers and roman numbers in the interval [1, 3999] too.


-- OPTIONAL TODO




