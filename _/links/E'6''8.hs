--
--
--
----------------
-- Exercise 6.8.
----------------
--
--
--
module E'6''8 where



import Pictures ( Picture )

import Data.List ( transpose )

import Test.HUnit




example = fst
expected = snd

testRotate90_1_Data

 = ( -- example (input):
     [
       ".##.",
       ".#.#",
       ".###",
       "####"
     ],
     -- expected (output):
     [
       "#...",
       "####",
       "##.#",
       "###."
     ]
   )


-- If picture is rectangular:
rotate90 :: Picture -> [[Char]]
rotate90 picture

 =  transpose (reverse picture)


testRotate90_1

 =  TestCase (
               assertEqual
               ""
               ( expected testRotate90_1_Data )
               ( rotate90 (example testRotate90_1_Data) )
             )


-- GHCi> runTestTT testRotate90_1


-- Other solution for "rotate90":


-- If picture is rectangular:
rotate90' :: Picture -> [[Char]]
rotate90' picture

 =  [ rotatedColumn column | column <- countColumnsUp ]
 
 where 
 
 rows :: Int
 rows =  length picture
 
 columns :: Int
 columns =  length (picture !! 0)

 countRowsDown :: [Int]
 countRowsDown =  [(rows - 1) , (rows - 1 - 1) .. 0]
 
 countColumnsUp :: [Int]
 countColumnsUp =  [0 .. (columns - 1)]
 
 rotatedColumn :: Int -> [Char]
 rotatedColumn column
 
  =  [ (picture !! row) !! column | row <- countRowsDown ]
             
             
-- Counting down: GHCi> let start = 10; stop = 0 
--                    > [ start, (start - 1) .. stop ]
--
-- [ 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0 ]


testRotate90'_1

 =  TestCase
 (
   assertEqual
   ""
   ( expected testRotate90_1_Data )
   ( rotate90' (example testRotate90_1_Data) )
 )

-- GHCi> runTestTT testRotate90'_1




