--
--
--
----------------
-- Exercise 8.2.
----------------
--
--
--
module E'8''2 where



import B'C'8 ( Tournament )
-- Note: Chapter 4> cabal install

import B'C'4   
 (
   Move ( Rock , Paper , Scissors )
 )

import E'8''1 ( outcome )




tournamentOutcome :: Tournament -> Integer
tournamentOutcome ( [] , _  ) = 0
tournamentOutcome ( _  , [] ) = 0
tournamentOutcome ( 
                    (firstPlayerMove  : remainingFirstPlayerMoves ) ,
                    (secondPlayerMove : remainingSecondPlayerMoves)
                  )

 =     (outcome firstPlayerMove secondPlayerMove)
    +  tournamentOutcome ( remainingFirstPlayerMoves , remainingSecondPlayerMoves )


{- GHCi>

tournamentOutcome ( [] , [] )
tournamentOutcome ( [Rock, Rock, Paper] , [Scissors, Paper, Rock] )

-}
-- 0
-- 1




