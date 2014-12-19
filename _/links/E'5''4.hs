--
--
--
----------------
-- Exercise 5.4.
----------------
--
--
--
module E'5''4 where



import E'5''1 ( maxOccurs , maxOccurs' , maxThreeOccurs )
import E'5''2 ( orderTriple )
import E'5''3 ( xIntercept )

import Test.QuickCheck
import Test.HUnit




-- Testing "maxOccurs":


prop_maxOccurs :: Integer -> Integer -> Bool
prop_maxOccurs a b

 =  (maxOccurs a b) == (maxOccurs' a b)

-- GHCi> quickCheck prop_maxOccurs



-- Unit tests:


-- 1: Zero
-- 2: One
testMaxOccurs1 =  TestCase ( assertEqual "for: maxOccurs 0 0" (0, 2) (maxOccurs 0 0) )
testMaxOccurs2 =  TestCase ( assertEqual "for: maxOccurs 1 1" (1, 2) (maxOccurs 1 1) )

-- 3: All equal
testMaxOccurs3 =  TestCase ( assertEqual "for: maxOccurs 2 2" (2, 2) (maxOccurs 2 2) )

-- 4: Positive maximum first
-- 5: Positive maximum second
testMaxOccurs5 =  TestCase ( assertEqual "for: maxOccurs 3 2" (3, 1) (maxOccurs 3 2) )
testMaxOccurs4 =  TestCase ( assertEqual "for: maxOccurs 2 3" (3, 1) (maxOccurs 2 3) )

-- 6: Negative maximum first
-- 7: Negative maximum second
testMaxOccurs6 =  TestCase (  assertEqual "for: maxOccurs (-2) (-3)" (-2, 1) ( maxOccurs (-2) (-3) )  )
testMaxOccurs7 =  TestCase (  assertEqual "for: maxOccurs (-3) (-2)" (-2, 1) ( maxOccurs (-3) (-2) )  )

testsMaxOccurs
 =  TestList
 [
   testMaxOccurs1 ,
   testMaxOccurs2 ,
   testMaxOccurs3 ,
   testMaxOccurs4 ,
   testMaxOccurs5 ,
   testMaxOccurs6 ,
   testMaxOccurs7
 ]

-- GHCi> runTestTT testsMaxOccurs



-- Testing "orderTriple":


-- 1: Zero
-- 2: One
testOrderTriple1 =  TestCase (  assertEqual "for: orderTriple (0, 0, 0)" (0, 0, 0) ( orderTriple (0, 0, 0) )  )
testOrderTriple2 =  TestCase (  assertEqual "for: orderTriple (1, 1, 1)" (1, 1, 1) ( orderTriple (1, 1, 1) )  )

-- 3: All equal
testOrderTriple3 =  TestCase (  assertEqual "for: orderTriple (2, 2, 2)" (2, 2, 2) ( orderTriple (2, 2, 2) )  )

-- 4: Ordered, one element different
-- 5: Unordered, one element different, second position
-- 6: Unordered, one element different, first position
testOrderTriple4 =  TestCase (  assertEqual "for: orderTriple (2, 2, 3)" (2, 2, 3) ( orderTriple (2, 2, 3) )  )
testOrderTriple5 =  TestCase (  assertEqual "for: orderTriple (2, 3, 2)" (2, 2, 3) ( orderTriple (2, 3, 2) )  )
testOrderTriple6 =  TestCase (  assertEqual "for: orderTriple (3, 2, 2)" (2, 2, 3) ( orderTriple (3, 2, 2) )  )

-- 7: Ordered, two elements different
-- 8: Unordered, two elements different, first and third position
-- 9: Unordered, two elements different, first and second position
testOrderTriple7 =  TestCase (  assertEqual "for: orderTriple (2, 3, 3)" (2, 3, 3) ( orderTriple (2, 3, 3) )  )
testOrderTriple8 =  TestCase (  assertEqual "for: orderTriple (3, 2, 3)" (2, 3, 3) ( orderTriple (3, 2, 3) )  )
testOrderTriple9 =  TestCase (  assertEqual "for: orderTriple (3, 3, 2)" (2, 3, 3) ( orderTriple (3, 3, 2) )  )

testsOrderTriple
 =  TestList
 [
   testOrderTriple1 ,
   testOrderTriple2 ,
   testOrderTriple3 ,
   testOrderTriple4 ,
   testOrderTriple5 ,
   testOrderTriple6 ,
   testOrderTriple7 ,
   testOrderTriple8 ,
   testOrderTriple9
 ]

-- GHCi> runTestTT testsOrderTriple



-- Testing: "xIntercept"


prop_xIntercept :: (NonZero Float, Float) -> Bool
prop_xIntercept (NonZero a, b)

 =      (snd aIsNonZero) == True
    &&  (snd aIsZero   ) == False
 
 where
 
 aIsNonZero :: (Float, Bool)
 aIsNonZero =  xIntercept (a, b)
 
 aIsZero :: (Float, Bool)
 aIsZero =  xIntercept (0, b)

-- GHCi> quickCheck prop_xIntercept


-- Unit tests:


-- 1: Zero
-- 2: One
testX_Intercept1 =  TestCase (  assertEqual "for: xIntercept (0, 0)" (0, False) ( xIntercept (0, 0) )  )
testX_Intercept2 =  TestCase (  assertEqual "for: xIntercept (1, 1)" (-1, True) ( xIntercept (1, 1) )  )

testsX_Intercept
 = TestList
 [
   testX_Intercept1 ,
   testX_Intercept2
 ]

-- GHCi> runTestTT testsX_Intercept



-- Example-Evaluation for maxOccurs:

--   maxOccurs (-3) 3
--   ??   (-3) > 3
--   ?? = False
--   ??   (-3) < 3
--   ?? otherwise
-- = ( 3 , 1 )


-- Example-Evaluation for orderTriple:

--   orderTriple 3 3 (-3)
-- = ( minimum , middle , maximum )
-- |
-- | where
-- |
-- |   minimum
-- | = minThree 3 3 (-3)
-- | = -3
-- |
-- |   middle
-- | = middleNumber 3 3 (-3)
-- | = 3
-- |
-- |   maximum
-- | = maxThree 3 3 (-3)
-- | = 3
-- |
-- = ( -3 , 3 , 3 )


-- Example-Evaluation for xIntercept:

--   xIntercept (-3.0) 3.0
--   ??   (-3.0) == 0
--   ?? = False
--   ?? otherwise
-- = ( -(3.0 / -3.0) , True )
-- = (       -(-1.0) , True )
-- = (           1.0 , True )




