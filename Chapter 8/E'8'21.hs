--
--
--
-----------------
-- Exercise 8.21.
-----------------
--
--
--
module E'8'21 where



import B'C'8 ( Tournament )

import E'8''2 ( tournamentOutcome )




showTournament :: Tournament -> String
showTournament tournament

 =     "Game:\n\n"
    ++ showTournament' tournament ++ "\n"
    ++ "Score, player 1: " ++ score_1 ++ "\n"
    ++ " \"      \"     2: " ++ score_2 ++ "\n"
 
 where
 
 showTournament' :: Tournament -> String
 showTournament' ( [] , [] ) = ""
 showTournament' ( latestMove_1 : remainingMoves_1 , latestMove_2 : remainingMoves_2 )
 
  =     (show latestMove_1) ++ " " ++ (show latestMove_2) ++ "\n"
    
     ++ showTournament' ( remainingMoves_1 , remainingMoves_2 )
 
 score :: Integer
 score =  tournamentOutcome tournament
 
 score_1 , score_2 :: String
 
 score_1 =  show ( score)
 score_2 =  show (-score)



{- GHCi>

let exampleTournament = playSvsS beatLast loseLast 10

putStr (showTournament exampleTournament)

-}
-- Game:
-- 
-- P S
-- R R
-- P S
-- R R
-- P S
-- R R
-- P S
-- R R
-- P S
-- R R
-- 
-- Score, player 1: -5
--  "      "     2: 5




