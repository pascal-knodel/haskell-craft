--
--
--
-----------------
-- Exercise 5.13.
-----------------
--
--
--
module E'5'13 where



import E'5'11 (  Point  ,  NewShape ( NewCircle , NewRectangle , NewTriangle )  )

import Test.HUnit




isOver :: NewShape -> NewShape -> Bool
isOver (NewCircle r1 p1) (NewCircle r2 p2)

 =  distance p1 p2 <= ( (abs r1) + (abs r2) )

 where
       
   -- Euclidean distance:
   
 distance :: Point -> Point -> Float
 distance ( x1 , y1 ) ( x2 , y2 ) =  sqrt ( (x1 - x2)^2 + (y1 - y2)^2 )

isOver r1 r2 

 |      isOverWidth r1 r2
    ||  isOverHeight r1 r2  = True
 |  otherwise               = False
 
 where
 
 isOverWidth (  NewRectangle h1 w1 ( x1 , y1 )  ) (  NewRectangle h2 w2 ( x2 , y2 )  )
  
  =     ( abs (y1 - y2) ) <= (max h1 h2) / 2
     && ( abs (x1 - x2) ) <= ( (abs w1) + (abs w2) ) / 2.0
     
 isOverHeight (  NewRectangle h1 w1 ( x1 , y1 )  ) (  NewRectangle h2 w2 ( x2 , y2 )  )
  
  =      ( abs (x1 - x2) ) <= (max w1 w2) / 2
     &&  ( abs (y1 - y2) ) <= ( (abs h1) + (abs h2) ) / 2.0


{- GHCi>

isOver ( NewCircle 1 ( 0 , 0 ) ) ( NewCircle 1 ( 2 , 2 ) )
isOver ( NewCircle 1 ( 0 , 0 ) ) ( NewCircle 1 ( 1 , 1 ) )

-}
-- False
-- True



-- Unit tests:


-- 1: Circles, identical points
testIsOver1 =  TestCase (
                          assertEqual
                          "for: isOver (NewCircle 0 (0, 0)) (NewCircle 0 (0, 0))"
                          True
                          (   isOver (  NewCircle 0 ( 0 , 0 )  ) (  NewCircle 0 (0, 0)  )   )
                        )
-- 2: Circles, intersection in a single point
testIsOver2 =  TestCase (
                          assertEqual
                          "for: isOver (NewCircle 1 (-1, 0)) (NewCircle 1 (1, 0))"
                          True
                          (   isOver (  NewCircle 1 ( -1 , 0 )  ) (  NewCircle 1 ( 1 , 0 )  )   )
                        )
-- 3: Circles, intersection in two distinct points   
testIsOver3 =  TestCase (
                          assertEqual
                          "for: isOver (NewCircle 1 (-0.5, 0)) (NewCircle 1 (0.5, 0))"
                          True
                          (   isOver (  NewCircle 1 ( -0.5 , 0 )  ) (  NewCircle 1 ( 0.5 , 0 )  )   )
                        )
-- 4: Circles, no Intersection
testIsOver4 =  TestCase (
                          assertEqual
                          "for: isOver (NewCircle 1 (-2, 0)) (NewCircle 1 (2, 0))"
                          False
                          (   isOver (  NewCircle 1 ( -2 , 0 )  ) (  NewCircle 1 ( 2 , 0 )  )   )
                        )
-- 5: Rectangles, identical points
testIsOver5 =  TestCase (
                          assertEqual
                          "for: isOver (NewRectangle 0 0 (0, 0)) (NewRectangle 0 0 (0, 0)"
                          True
                          (   isOver (  NewRectangle 0 0 ( 0 , 0 )  ) (  NewRectangle 0 0 ( 0 , 0 )  )   )
                        )
-- 6: Rectangles, intersection in a single side
testIsOver6 =  TestCase (
                          assertEqual
                          "for: isOver (NewRectangle 1 1 (-0.5, 0)) (NewRectangle 1 1 (0.5, 0))"
                          True
                          (   isOver (  NewRectangle 1 1 ( -0.5 , 0 )  ) (  NewRectangle 1 1 ( 0.5 , 0 )  )   )
                        )
-- 7: Rectangles, intersection in two distinct points
testIsOver7 =  TestCase (
                          assertEqual
                          "for: isOver (NewRectangle 1 1 (-0.5, 0)) (NewRectangle 1 1 (0, -0.5))"
                          True
                          (   isOver (  NewRectangle 1 1 ( -0.5 , 0 )  ) (  NewRectangle 1 1 ( 0 , -0.5 )  )   )
                        )
-- 8: Rectangles, no intersection
testIsOver8 =  TestCase (
                          assertEqual
                          "for: isOver (NewRectangle 1 1 (-1, 0)) (NewRectangle 1 1 (1, 0))"
                          False
                          (   isOver (  NewRectangle 1 1 ( -1 , 0 )  ) (  NewRectangle 1 1 ( 1 , 0 )  )   )
                        )
-- 9: Rectangles, different sizes, intersection in two distinct points
testIsOver9 =  TestCase (
                          assertEqual
                          "for: isOver (NewRectangle 1 1 (0, 0)) (NewRectangle 2 2 (1, 0))"
                          True
                          (   isOver (  NewRectangle 1 1 ( 0 , 0 )  ) (  NewRectangle 2 2 ( 1 , 0 )  )   )
                        )  
                       
testsIsOver
 = TestList
 [
   testIsOver1 ,
   testIsOver2 ,
   testIsOver3 ,
   testIsOver4 ,
   testIsOver5 ,
   testIsOver6 ,
   testIsOver7 ,
   testIsOver8 ,
   testIsOver9
 ]

-- GHCi> runTestTT testsIsOver




