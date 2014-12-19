--
--
--
-----------------
-- Exercise 8.20.
-----------------
--
--
--
module E'8'20 where



import B'C'8
 (
   Strategy
 , Tournament
 , step
 )

import E'8''3
 ( 
   beatLast
 , loseLast
 )



playSvsS :: Strategy -> Strategy -> Integer -> Tournament
playSvsS strategy_1 strategy_2 numberOfTurns

 =  playSvsS' strategy_1 strategy_2 numberOfTurns ( [] , [] )
 
 where
 
 playSvsS' :: Strategy -> Strategy -> Integer -> Tournament -> Tournament
 playSvsS' _ _ 0 tournamentAccumulator = tournamentAccumulator
 playSvsS' strategy_1 strategy_2 numberOfTurns tournamentAccumulator
 
  =  playSvsS' strategy_1 strategy_2 (numberOfTurns - 1) (step strategy_1 strategy_2 tournamentAccumulator)


-- GHCi> playSvsS beatLast loseLast 10
-- ( [P, R, P, R, P, R, P, R, P, R] ,
--   [S, R, S, R, S, R, S, R, S, R]   )



-- Other solutions for "playSvsS":


playSvsS' :: Strategy -> Strategy -> Integer -> Tournament
playSvsS' strategy_1 strategy_2 numberOfTurns

 |  numberOfTurns < 1  = ( [] , [] )
 |  otherwise          = playSvsS' strategy_1 strategy_2 (numberOfTurns - 1)



playSvsS'3 :: Strategy -> Strategy -> Integer -> Tournament
playSvsS'3 strategy_1 strategy_2 numberOfTurns

 =  if   (numberOfTurns < 1)
    then ( [] , [] )
    else playSvsS'3 strategy_1 strategy_2 (numberOfTurns - 1)




