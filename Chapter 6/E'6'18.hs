--
--
--
-----------------
-- Exercise 6.18.
-----------------
--
--
--
module E'6'18 where



import Pictures ( Picture )

import Test.HUnit




maxOfInts :: [Int] -> Int
maxOfInts []           =  error "List is empty."
maxOfInts [int]        =  int
maxOfInts (int : ints) =  max int (maxOfInts ints)


rectangularize :: Picture -> Picture
rectangularize picture

 =  [ pad row | row <- picture ]
 
 where
 
 longestRowLength :: Int
 longestRowLength =  maxOfInts [ length column | column <- picture ]
 
 pad :: String -> String
 pad row =  row ++ (  replicate ( longestRowLength - (length row) ) '.'  )


testRectangularize1

 = TestCase ( assertEqual "" ["..", "..", ".."] (rectangularize ["", ".", ".."]) )

-- GHCi> runTestTT testRectangularize1




