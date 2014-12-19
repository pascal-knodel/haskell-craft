--
--
--
------------------
-- Exercise 10.37.
------------------
--
-- 
--
module E'10'37 where



import E'10'36

 (
   Move ( Rock , Paper , Scissors )
 , outcome
 , Tournament
 , tournamentOutcome
 )




showTournament :: Tournament -> String
showTournament tournament@( firstPlayerMoves , secondPlayerMoves )

 =     "\nGame   :\n\n"
    ++ "Player =     1 | 2\n"
    ++ "             - | -\n"
    ++ concat ( zipWith showTurn firstPlayerMoves secondPlayerMoves )
    ++ "             - | -\n"
    ++ "Winner =     " ++ winner         ++ "\n\n"
    ++ "Score  =     " ++ ( show score ) ++ "\n\n"
 
 where
 
 showTurn :: Move -> Move -> String
 showTurn a b
 
  =  showTurn' ( outcome a b ) a b
 
 showTurn' :: Integer -> Move -> Move -> String
 showTurn'   1  a b =    "           * " ++ ( show a ) ++ " | " ++ ( show b ) ++ "\n"
 showTurn' (-1) a b =    "             " ++ ( show a ) ++ " | " ++ ( show b ) ++ " *\n"
 showTurn' _    a b =    "             " ++ ( show a ) ++ " | " ++ ( show b ) ++ "\n"
 
 
 score :: Integer
 score =  tournamentOutcome tournament
 
 winner :: String
 winner
               -- "Player :   1   2"
               -- "Winner :        "
  |  score < 0 =             "  | 2"
  |  score > 0 =             "1 |  "
  |  otherwise =             "1 | 2     (DRAW)"



{- GHCi>

putStr (  showTournament ( [ Scissors , Rock ] , [ Rock , Scissors ] )  )
putStr (  showTournament ( [ Scissors , Rock ] , [ Rock , Rock ] )  )

-}
--
-- Game   :
-- 
-- Player =     1 | 2
--              - | -
--              S | R *
--            * R | S
--              - | -
-- Winner =     1 | 2     (DRAW)
-- 
-- Score  =     0
--
--
-- Game   :
-- 
-- Player =     1 | 2
--              - | -
--              S | R *
--              R | R
--              - | -
-- Winner =       | 2
-- 
-- Score  =     -1
--




