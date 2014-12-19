--
--
--
-----------------
-- Exercise 6.10.
-----------------
--
--
--
module E'6'10 where



import E'6''8
 ( 
   example
 , expected
 )

import Pictures ( Picture )

import Test.HUnit




testScale_1_Data

 =  (
      -- example:
      [
        "#.#" ,
        "..#"
      ] ,
	  
	  -- expected:
      [
        "##..##" ,
        "##..##" ,
        "....##" ,
         "....##"
     ]
    )


replicateItems :: [a] -> Int -> [a]
replicateItems list itemRepetitions

 =  [ item | item  <- list , repetition <- [1 .. itemRepetitions] ]
   
   
scale :: Picture -> Int -> Picture
scale picture int

 |  int < 1    = [[]]
 |  otherwise  = replicateItems [ replicateItems row int | row <- picture ] int


testScale1

 =  TestCase
 (
   assertEqual
   ""
   ( expected testScale_1_Data )
   ( scale ( example testScale_1_Data ) 2 )
 )

-- GHCi> runTestTT testScale1




