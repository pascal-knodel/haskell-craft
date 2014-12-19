--
--
--
-----------------
-- Exercise 6.36.
-----------------
--
--
--
module E'6'36 where



import B'C'6 ( Image )

import E'6''6 ( superimpose )
import E'6'35
 (
   padAbove
 , padBeside
 )

import Pictures ( Picture )




superimposeImage :: Image -> Image -> Image
superimposeImage ( a , (aX , aY) ) ( b , (bX , bY) )

 =  ( abSuperimposition , (abSuperimpositionX , abSuperimpositionY) )   -- abSuperimposition
 
 where

 axOffset, ayOffset, bxOffset, byOffset :: Integer
 -- "a is fixed". 
 axOffset =  bX - aX
 ayOffset =  bY - aY
 -- "b is fixed".
 bxOffset =  aX - bX
 byOffset =  aY - bY

 aPadded, bPadded :: Picture
 aPadded =  aPaddedBesideAndAbove
 bPadded =  bPaddedBesideAndAbove
 
 aPaddedBeside, aPaddedBesideAndAbove, bPaddedBeside, bPaddedBesideAndAbove :: Picture
 aPaddedBeside         =  padBeside a (fromInteger axOffset)
 aPaddedBesideAndAbove =  padAbove aPaddedBeside (fromInteger ayOffset)
 bPaddedBeside         =  padBeside b (fromInteger bxOffset)
 bPaddedBesideAndAbove =  padAbove bPaddedBeside (fromInteger byOffset)
  
 abSuperimposition :: Picture
 abSuperimposition =  superimpose aPadded bPadded

 abSuperimpositionX, abSuperimpositionY :: Integer
 abSuperimpositionX =  min aX bX
 abSuperimpositionY =  min aY bY

 
{- GHCi> 

:a E'6'32
:m +E'6'36

let a = ["#." , "#."]

-- #.
-- #.
        
let aX = 0
let aY = 0


let b = [".#" , ".#"]

-- .#
-- .#
        
let bX = -2
let bY = -2
         
let img = superimposeImage ( a , (aX , aY) ) ( b , (bX , bY) )

printImage img

-}
-- ..#.
-- ..#.
-- .#..
-- .#..


-- Note: see ex. 12.6 for corrections.




