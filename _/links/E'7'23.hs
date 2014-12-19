--
--
--
-----------------
-- Exercise 7.23.
-----------------
--
--
--
module E'7'23 where



import Prelude hiding ( zip , zip3 )

import GHC.List ( zip )

import qualified GHC.List ( zip3 )

import Test.QuickCheck




zip3 :: ( [a] , [b] , [c] ) -> [ (a , b , c) ] -- Primitive recursion:
zip3 ( [] , _  , _  ) = []
zip3 ( _  , [] , _  ) = []
zip3 ( _  , _  , [] ) = []
zip3 (
       firstComponent  : remainingFirstComponents  ,
       secondComponent : remainingSecondComponents ,
       thirdComponent  : remainingThirdComponents
     )

 =    ( firstComponent , secondComponent , thirdComponent )
    : zip3 ( remainingFirstComponents , remainingSecondComponents , remainingThirdComponents )


prop_zip3 :: ( [Int] , [Int] , [Int] ) -> Bool
prop_zip3 listTriple@(
                       firstComponents  ,
                       secondComponents , 
                       thirdComponents
                     ) -- listTriple is an alias for (firstComponents, secondComponents, thirdComponents).

 =  zip3 listTriple == GHC.List.zip3 firstComponents secondComponents thirdComponents


-- GHCi> quickCheck prop_zip3



zip3' :: ( [a] , [b] , [c] ) -> [ (a, b, c) ]
zip3' ( leftComponents , middleComponents , rightComponents )

 = map toTriple valueAndTuple
 
 where
 
 valueAndTuple =  zip leftComponents (zip middleComponents rightComponents)
 
 toTriple ( leftComponent , ( middleComponent , rightComponent ) ) =  ( leftComponent , middleComponent , rightComponent )


prop_zip3' :: ( [Int] , [Int] , [Int] ) -> Bool
prop_zip3' listTriple@(
                        firstComponents  ,
                        secondComponents , 
                        thirdComponents
                      ) -- listTriple is an alias for (firstComponents , secondComponents , thirdComponents).

 =  zip3' listTriple == GHC.List.zip3  firstComponents secondComponents thirdComponents


-- GHCi> quickCheck prop_zip3'



-- Advantages:
-- -----------
--
-- zip3 with (primitive) recursion:
--
-- * In my opinion 'recursion' is very explicit. That is, you have direct access to the problem description
--   and you might change it at every time.
--
-- * Well chosen standard templates are a good thing to use. Most people who are in to the subject will
--   understand them easily and fast.
--
--
-- zip3 without recursion:
--
-- * The problem description is shorter (348 characters). In this case it is not a real advantage.
--
-- * If you are using existing, well known definitions, the functions will have good performance that will satisfy most needs.
--   The community and technical papers offer support for their use.
--
--
-- Disadvantages:
-- --------------
--
-- zip3 with (primitive) recursion:
--
-- * The problem description is longer (477 characters). In this case it is not a real disadvantage.
-- 
-- * Don't waste your time reinventing functions that are already available.
--
-- * If you don't use existing, well known function definitions, you will spend more time
--   until your performance feelings are satisfied.
--
--
-- zip3 without recursion:
--
-- * You might have to trace function definitions to get a clue on how things work.
--   Usually this isn't a problem with a well written documentation.
-- 
-- * Later changes in definitions that you don't control could cause problems.
--
--
-- --------------
-- It depends ...



{- GHCi>

quickCheck prop_zip3
quickCheck prop_zip3'

-}




