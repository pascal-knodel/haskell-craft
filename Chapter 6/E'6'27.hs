--
--
--
-----------------
-- Exercise 6.27.
-----------------
--
--
--
module E'6'27 where



-- Run-length encoding of a black/white (; bicolor) picture:

type RunLength =  Int

type Width =  Int

type Picture'RWB =  (  Width , [ ( RunLength , Bool ) ]  )




