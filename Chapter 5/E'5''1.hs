--
--
--
----------------
-- Exercise 5.1.
----------------
--
--
--
module E'5''1 where




maxOccurs :: Integer -> Integer -> (Integer, Integer)
maxOccurs a b

 |      a > b  = ( a , 1 )
 |      a < b  = ( b , 1 )
 |  otherwise  = ( a , 2 )


{- GHCi>

maxOccurs 0 1
maxOccurs 0 1
maxOccurs 1 1

-}
-- ( 1 , 1 )
-- ( 1 , 1 )
-- ( 1 , 2 )



-- Other solution for "maxOccurs":


maxOccurs' ::  Integer -> Integer -> (Integer, Integer)
maxOccurs' a b

 |    a == b   = ( a , 2 )
 |  otherwise  = ( max a b , 1 )




-- To implement maxThreeOccurs we could reuse solutions from earlier exercises ...


-- Subchapter 3.2, Relational operators (example) ...


threeEqual :: Integer -> Integer -> Integer -> Bool
threeEqual a b c

 |      a == b
    &&  b == c  = True
 |  otherwise   = False
 

-- Exercise 4.1 ...


maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c

 =  max (max a b) c


-- Exercise 4.9 ...


fourEqual :: Integer -> Integer -> Integer -> Integer -> Bool
fourEqual a b c d 
 
 |      (threeEqual a b c)
    &&  a == d              = True
 |  otherwise               = False


threeEqualOfFour :: Integer -> Integer -> Integer -> Integer -> Bool
threeEqualOfFour a b c d
 
 |      threeEqual   b c d
    ||  threeEqual a   c d
    ||  threeEqual a b   d
    ||  threeEqual a b c    = True
 |  otherwise               = False
    
    
occurs :: Integer -> Integer -> Integer -> Integer -> Integer
occurs z a b c

 |  fourEqual z a b c         = 3
 |  threeEqualOfFour z a b c  = 2   
 |  otherwise                 = 1

-- Should be local / annotated to "maxThreeOccurs". Otherwise it could be misleading.


-- ...



maxThreeOccurs :: Integer -> Integer -> Integer -> (Integer, Integer)
maxThreeOccurs a b c

 =  ( maximum , occurrences )
  
 where
 
 maximum :: Integer
 maximum =  maxThree a b c
 
 occurrences :: Integer
 occurrences =  occurs maximum a b c


{- GHCi>

maxThreeOccurs 1 0 0
maxThreeOccurs 1 1 0
maxThreeOccurs 1 1 1

-}
-- ( 1 , 1 )
-- ( 1 , 2 )
-- ( 1 , 3 )




