--
--
--
----------------
-- Exercise 8.3.
----------------
--
--
--
module E'8''3 where



import B'C'8 ( Strategy )

-- Note: Chapter 4> cabal install

import B'C'4   
 (
   Move ( Rock , Paper , Scissors )
 , beat
 , lose
 )



beatLast :: Strategy
beatLast [] = Rock   -- Or "Paper" or "Scissors".
beatLast (latestMove : _)

 =  beat latestMove


 
loseLast :: Strategy
loseLast [] = Rock   -- Or "Paper" or "Scissors".
loseLast (latestMove : _)

 =  lose latestMove




