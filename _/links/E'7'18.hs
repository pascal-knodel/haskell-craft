--
--
--
-----------------
-- Exercise 7.18.
-----------------
--
--
--
module E'7'18 where



import E'7'16 ( ins'' , iSort'' )

import Test.QuickCheck
import Test.HUnit




-- Unit test data for "ins''" (ex. 7.16):


-- 1: Empty list
testIns''1 =  TestCase ( assertEqual "for: ins'' 1 []" [1] (ins'' 1 []) )

-- 2: List of length one
testIns''2 =  TestCase ( assertEqual "for: ins'' 1 [0]" [0, 1] (ins'' 1 [0]) )

-- 3: List that contains the element to be inserted
testIns''3 =  TestCase ( assertEqual "for: ins'' 1 [1]" [1] (ins'' 1 [1]) )

-- 4: insert left
testIns''4 =  TestCase ( assertEqual "for: ins'' 1 [2, 3]" [1, 2, 3] (ins'' 1 [2, 3]) )

-- 5: insert between
testIns''5 =  TestCase ( assertEqual "for: ins'' 2 [1, 3]" [1, 2, 3] (ins'' 2 [1, 3]) )

-- 6: insert right
testIns''6 =  TestCase ( assertEqual "for: ins'' 3 [1, 2]" [1, 2, 3] (ins'' 3 [1, 2]) )


testIns''
 =  TestList
 [
   testIns''1 ,
   testIns''2 ,
   testIns''3 ,
   testIns''4 ,
   testIns''5 ,
   testIns''6
 ]


-- GHCi> runTestTT testIns''



-- QuickCheck tests for "iSort''" (ex. 7.16):


prop_iSort''_removeDuplicates :: Integer -> Integer -> Property
prop_iSort''_removeDuplicates integer duplicates

 =  duplicates > 0
    ==> [integer] == iSort'' [ integer | _ <- [ 1 .. duplicates ] ]


-- GHCi> quickCheck prop_iSort''_removeDuplicates



{- GHCi>

runTestTT testIns''
quickCheck prop_iSort''_removeDuplicates

-}




