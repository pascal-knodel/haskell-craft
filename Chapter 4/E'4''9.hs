--
--
--
----------------
-- Exercise 4.9.
----------------
--
--
--
module E'4''9 where



import E'4''1 ( maxThree )
import E'4''4 ( fourEqual , fourDifferent , threeEqualOfFour )




-- "maxThreeOccurs" with local definition(s):
---------------------------------------------


maxThreeOccurs :: Int -> Int -> Int -> (Int , Int)
maxThreeOccurs a b c

 =  ( maximum , occurrences )
 
 where
 
 maximum :: Int
 maximum =  fromInteger (
                          maxThree ( toInteger a )
                                   ( toInteger b )
                                   ( toInteger c )
                        )
                  
 occurrences :: Int
 occurrences =  occurs maximum a b c
 
 occurs :: Int -> Int -> Int -> Int -> Int
 occurs num a b c

  |  fourEqual ( toInteger num )
               ( toInteger a   )
               ( toInteger b   )
               ( toInteger c   )        =  3
 
  |  threeEqualOfFour ( toInteger num ) 
                      ( toInteger a   )
                      ( toInteger b   )
                      ( toInteger c   ) =  2
 
  -- Because maximum exists:
  |                           otherwise =  1




-- "maxThreeOccurs" without local definition(s):
------------------------------------------------


maxThreeOccurs2 :: Int -> Int -> Int -> (Int , Int)
maxThreeOccurs2 a b c

 =  (
      fromInteger (
                    maxThree ( toInteger a )
                             ( toInteger b )
                             ( toInteger c )
                  )
    ,
       occurs (
                fromInteger (
                              maxThree ( toInteger a )
                                       ( toInteger b )
                                       ( toInteger c ) 
                            )
              )
              a
              b
              c
    )


occurs :: Int -> Int -> Int -> Int -> Int
occurs num a b c

 |  fourEqual ( toInteger num )
              ( toInteger a   )
              ( toInteger b   )
              ( toInteger c   )        =  3
 
 |  threeEqualOfFour ( toInteger num ) 
                     ( toInteger a   )
                     ( toInteger b   )
                     ( toInteger c   ) =  2
 
 -- Because maximum exists:
 |                           otherwise =  1





-- Other solution for "occurs":


occurs2 :: Int -> Int -> Int -> Int -> Int
occurs2 num a b c
     
 |      a == num
    &&  b == num
    &&  c == num                   =  3
    
 |      ( a == num  &&  b == num )
    ||  ( a == num  &&  c == num )
    ||  ( b == num  &&  c == num ) =  2
    
 |                       otherwise =  1



-- Other solution for "occurs":


occurs3 :: Int -> Int -> Int -> Int -> Int
occurs3 num a b c

 =     if ( a == num ) then 1 else 0
    +  if ( b == num ) then 1 else 0
    +  if ( c == num ) then 1 else 0




