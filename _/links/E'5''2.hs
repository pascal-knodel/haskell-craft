--
--
--
----------------
-- Exercise 5.2.
----------------
--
--
--
module E'5''2 where



-- To implement "orderTriple" we could reuse solutions from earlier exercises ...


-- Exercise 3.14 (almost identical to the solution of it).


minThree :: Integer -> Integer -> Integer -> Integer
minThree a b c =  min (min a b) c 


-- Exercise 4.1 ...


maxThree :: Integer -> Integer -> Integer -> Integer
maxThree a b c

 =  max (max a b) c


-- Exercise 4.2 ...


hasWeakAscendingOrder :: Integer -> Integer -> Integer -> Bool
hasWeakAscendingOrder a b c

 |      (b >= a)
    &&  (b <= c)  = True
	
   -- otherwise:
   --
   -- |      (a > b)
   --    ||  (c < b)  = False
 
 |  otherwise     = False


between :: Integer -> Integer -> Integer -> Bool
between a b c =  hasWeakAscendingOrder a b c


middleNumber :: Integer -> Integer -> Integer -> Integer
middleNumber a b c

 |      between b a c
    ||  between c a b  = a
 |      between a b c
    ||  between c b a  = b

   -- otherwise:
   --
   -- |     between a c b
   --   ||  between c b a  = c
 
 |  otherwise  = c


-- ...



orderTriple :: (Integer, Integer, Integer) -> (Integer, Integer, Integer)
orderTriple ( a , b , c )

 =  ( minimum , middle , maximum )

 where

 minimum :: Integer
 minimum =  minThree a b c
 
 middle :: Integer
 middle =  middleNumber a b c
 
 maximum :: Integer
 maximum =  maxThree a b c


{- GHCi>

orderTriple ( 3 , 2 , 1 )

-}
-- ( 1 , 2 , 3 )




