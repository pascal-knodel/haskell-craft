--
--
--
-----------------
-- Exercise 13.6.
-----------------
--
--
--
module E'13''6 where



-- Note: Chapter 5> cabal install

import E'5''5
 (
   Shape ( Circle , Rectangle )
 )
import E'5''7
 (
   area
 )

import B'C'13




instance Info Float where

 examples =  [ 3.0 , 45.9 , 87.6 ]
 size _   =  1


instance Info Shape where

 examples =  [ 
               Circle ( (examples :: [Float]) !! 0 ) ,
               Rectangle ( (examples :: [Float]) !! 1 ) ( (examples :: [Float]) !! 2 )
			 ]
 size     =  round . area


-- GHCi> examples :: [Shape]
-- [Circle 3.0, Rectangle 45.9 87.6]

-- GHCi> examples :: [[Shape]]
-- [ 
--   []                                         ,
--   [Circle 3.0]                               ,
--   [Rectangle 45.9 87.6]                      ,
--   [Circle 3.0, Circle 3.0]                   ,
--   [Circle 3.0, Rectangle 45.9 87.6]          ,
--   [Rectangle 45.9 87.6, Circle 3.0]          ,
--   [Rectangle 45.9 87.6, Rectangle 45.9 87.6]
-- ]




