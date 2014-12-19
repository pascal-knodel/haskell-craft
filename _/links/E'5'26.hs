--
--
--
-----------------
-- Exercise 5.26.
-----------------
--
--
--
module E'5'26 where



import E'5'24 ( pushRight )




-- Subchapter 5.2, example 3: ...


fibStep :: (Integer, Integer) -> (Integer, Integer)
fibStep ( u , v ) =  ( v , u + v )


fibPair :: Integer -> (Integer, Integer)
fibPair n

 |  n <= 0     = ( 0 , 1 )
 |  otherwise  = fibStep ( fibPair (n - 1) )

      
fastFib :: Integer -> Integer
fastFib =  fst . fibPair


-- ...



-- Naive recursive integer logarithm.
ilog :: Integer -> Integer -> Integer
ilog b n

 =  ilog' b n b
   
 where
   
 ilog' :: Integer -> Integer -> Integer -> Integer
 ilog' b' n' p'
         
  |  p' > n'    = 0
  |  otherwise  = 1 + ( ilog' b' n' (p' * b') )
   

-- Length (digit count) of an integer.
ilength :: Integer -> Integer
ilength n =  ( ilog 10 (abs n) ) + 1
        
        
fibTable :: Integer -> String
fibTable n

 =     "\n\n"
    ++ headline
    ++ "\n"
    ++ fibTable' n
    ++ "\n\n"
       
 where
         
 lineLengthN :: Integer
 lineLengthN =  ilength n
         
 lineLengthFN :: Integer
 lineLengthFN =  ( ilength (fastFib n) )
         
 spacing :: String
 spacing =  "\t"
         
 indentation :: String
 indentation =  "\t"
       
 headline :: String
 headline =     indentation
             ++ (pushRight "n" lineLengthN)
             ++ spacing
             ++ ( pushRight "fib n" (lineLengthFN + 4) )
             ++ "\n"
 
 fibTable' :: Integer -> String
 fibTable' n'

  |  n' == 0   =     indentation
                  ++ ( pushRight (show n') lineLengthN )
                  ++ spacing
                  ++ (   pushRight (  show ( fst (fibPair n') )   ) (  lineLengthFN + ( toInteger (length "fib ") )  )  )
                  ++ "\n"
 
  | otherwise  =     fibTable' (n' - 1)
                  ++ indentation
                  ++ ( pushRight (show n') lineLengthN )
                  ++ spacing
                  ++ (   pushRight (  show ( fst (fibPair n') )  ) (  lineLengthFN + ( toInteger (length "fib ") )  )   )
                  ++ "\n"

-- GHCi> writeFile "fibonacci_500.txt" (fibTable 500)

-- GHCi> writeFile "fibonacci_500.txt" $ fibTable 500




