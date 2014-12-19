--
--
--
----------------
-- Exercise 5.7.
----------------
--
--
--
module E'5''7 where



import E'5''5 (  Shape ( Circle , Rectangle , Triangle )  )




-- Added "| Triangle Float Float Float" to the Shape-constructor in exercise 5.5.


-- Extended definitions.


isRound :: Shape -> Bool
isRound (Circle _)       =  True
isRound (Rectangle _ _)  =  False
isRound (Triangle a b c) =  False


-- To implement "area" we could reuse solutions from earlier exercises ...


triArea :: Float -> Float -> Float -> Float
triArea a b c
      
 |  possible   = sqrt (   s
                        * (s - a)
                        * (s - b)
                        * (s - c)
                      )
 |  otherwise  = 0

 where
 
 threePositive :: Float -> Float -> Float -> Bool
 threePositive a b c 
 
  |      a > 0
     &&  b > 0
     &&  c > 0  = True
  |  otherwise  = False
 
 isNoImpossibleTriangle :: Float -> Float -> Float -> Bool
 isNoImpossibleTriangle a b c
  
     -- If triangle inequality ***
  |     (a < (b + c))
     && (b < (a + c))
     && (c < (a + b))  = True   -- *** is satisfied.
  |  otherwise         = False
 
 possible :: Bool
 possible
 
  |     threePositive a b c
     && isNoImpossibleTriangle a b c  = True
  |  otherwise                        = False
 
 s :: Float
 s = (a + b + c) / 2


-- ...



area :: Shape -> Float
area (Circle r) = Prelude.pi * r^2
area (Rectangle h w) = h * w
area (Triangle a b c) = triArea a b c


-- Added "perimeter (Triangle a b c) = a + b + c" to the 
-- pattern matching definition of perimeter in exercise 5.5.


{- GHCi>

area (Circle 1)
area (Rectangle 1 1)
area (Triangle 1 1 1)

-}
-- 3.1415927
-- 1.0
-- 0.4330127


-- Note: My beginner mistakes in pattern matching, see "Examples/· Errors".




