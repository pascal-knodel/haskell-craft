--
--
--
-----------------
-- Exercise 7.19.
-----------------
--
--
--
module E'7'19 where



import Prelude
import qualified Prelude ( (<) , (>) )




type IntegerPair =  (Integer, Integer)


iSort''' :: [IntegerPair] -> [IntegerPair]
iSort''' [] = []
iSort''' ( integerPair : remainingIntegerPairs )

 =  ins''' integerPair (iSort''' remainingIntegerPairs)
 

ins''' :: IntegerPair -> [IntegerPair] -> [IntegerPair]
ins''' integerPair [] = [integerPair]
ins''' integerPair@( integerPairLeft , integerPairRight ) -- integerPair is an alias for (integerPairLeft, integerPairRight).
       (
         listIntegerPair@(listIntegerPairLeft , listIntegerPairRight) : remainingListIntegerPairs
         -- listIntegerPair is an alias for (listIntegerPairLeft, listIntegerPairRight).
       )
 
 |  integerPair < listIntegerPair  = integerPair : (listIntegerPair : remainingListIntegerPairs) -- Uses a redefinition of <, see below. Be aware of locality.
 |  otherwise                      = listIntegerPair : (ins''' integerPair remainingListIntegerPairs)

 where
 
 (<) :: IntegerPair -> IntegerPair -> Bool
 (<) (firstLeft , secondLeft) (firstRight , secondRight)
 
  |  firstLeft Prelude.< firstRight  = True
  |  firstLeft Prelude.> firstRight  = False
  |  otherwise                       = if   (secondLeft Prelude.< secondRight)
                                       then ( True  )
                                       else ( False )
 

{- GHCi>

iSort''' [ (2, 1), (2, 0), (1, 0) ]

-}
-- [ ( 1 , 0 ) , ( 2 , 0 ) , ( 2 , 1 ) ]




