--
--
--
-----------------
-- Exercise 12.7.
-----------------
--
--
--
module E'12''7 where



-- Note: Chapter 4> cabal install
--       Chapter 8> cabal install



import B'C'4
 (
   Move ( Rock , Paper , Scissors )
 )

import B'C'8
 (
   Strategy
 , randInt
 )




sToss :: Strategy -> Strategy -> Strategy
sToss s1 s2

 =  \moves -> case randInt 2 `rem` 2 of
              
			  0 -> s1 moves
			  1 -> s2 moves


{- GHCi>

:m +E'8''5 E'8''6

let s =  sToss reactPattern counterMostFrequent

s [Rock]
s [Paper]
s [Scissors]

let s =  sToss reactPattern counterMostFrequent

s [Rock]
s [Paper]
s [Scissors]

-}
-- P
-- S
-- R
--
-- P
-- S
-- S
--
-- Note: random.




