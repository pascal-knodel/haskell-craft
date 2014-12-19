--
--
--
-----------------
-- Exercise 7.13.
-----------------
--
--
--
module E'7'13 where



import E'7'12 ( ins )

import Test.HUnit




-- Unit test data for "ins" (ex. 7.12):


-- 1: Empty list
testIns1 =  TestCase ( assertEqual "for: ins 1 []" [1] (ins 1 []) )

-- 2: List of length one
testIns2 =  TestCase ( assertEqual "for: ins 1 [0]" [0, 1] (ins 1 [0]) )

-- 3: List that contains the element to be inserted
testIns3 =  TestCase ( assertEqual "for: ins 1 [1]" [1, 1] (ins 1 [1]) )

-- 4: Insert left
testIns4 =  TestCase ( assertEqual "for: ins 1 [2, 3]" [1, 2, 3] (ins 1 [2, 3]) )

-- 5: Insert between
testIns5 =  TestCase ( assertEqual "for: ins 2 [1, 3]" [1, 2, 3] (ins 2 [1, 3]) )

-- 6: Insert right
testIns6 =  TestCase ( assertEqual "for: ins 3 [1, 2]" [1, 2, 3] (ins 3 [1, 2]) )


testIns
 =  TestList
 [
   testIns1 ,
   testIns2 ,
   testIns3 ,
   testIns4 ,
   testIns5 ,
   testIns6
 ]


-- GHCi> runTestTT testIns




