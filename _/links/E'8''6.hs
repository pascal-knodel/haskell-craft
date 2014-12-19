--
--
--
----------------
-- Exercise 8.6.
----------------
--
--
--
module E'8''6 where



import B'C'8 ( Strategy )

-- Note: Chapter 4> cabal install

import B'C'4
 (
   Move ( Rock , Paper , Scissors )
 )




-- In the guides on the net they said it could be an advantage to decide
-- the move in the very last moment. But how would we implement this? Maybe
-- with an additional type, indicating Information about what the next
-- move of the opponent could be. Example: similarity of Paper and Scissors.
-- And we would need the output of the device that scans the opponent :P
-- I'm not able to handle state in functional programming yet, so I have to
-- think of another 'move counting' strategy ...



react :: Move -> Move
react move

 =  case (move) of
 
    Rock     -> Paper      -- Win against last Rock.
    Paper    -> Rock       -- Lose against last Paper.
    Scissors -> Scissors   -- Draw with last Scissors.


reactPattern :: Strategy
reactPattern [] = Rock
reactPattern (latestMove : _)

 =  react latestMove


reactPattern' :: Strategy
reactPattern' [] = Rock
reactPattern' [latestMove] = Rock
reactPattern' (_ : moveBeforeLatestMove : _)

 =  react moveBeforeLatestMove



-- More suggestions: Play least frequent, 
-- play average frequent, don't play last two moves, ...




