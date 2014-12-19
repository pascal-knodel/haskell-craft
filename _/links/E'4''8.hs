--
--
--
----------------
-- Exercise 4.8.
----------------
--
--
--
module E'4''8 where




triArea :: Float -> Float -> Float -> Float
triArea a b c
 
 |   possible =  sqrt ( 
                        s
                          * ( s - a )
                          * ( s - b )
                          * ( s - c )
                      )
 
 |  otherwise =  0
 
 
 where
 
 
 s = ( a + b + c ) / 2
 
 
 are_3_Positive :: Float -> Float -> Float -> Bool
 are_3_Positive a b c 
 
  |      a > 0
     &&  b > 0
     &&  c > 0     =  True
 
  |       otherwise =  False
 
 
 isNoImpossibleTriangle :: Float -> Float -> Float -> Bool
 isNoImpossibleTriangle a b c
 
  -- If triangle inequality is satisfied:
  |      a < ( b + c )
     &&  b < ( a + c )
     &&  c < ( a + b ) =  True
     
  |         otherwise  =  False
 
 
 possible :: Bool
 possible
 
  |      are_3_Positive a b c
     &&  isNoImpossibleTriangle a b c =  True
     
  |                        otherwise  =  False




