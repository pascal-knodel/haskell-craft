--
--
--
----------------
-- Exercise 8.5.
----------------
--
--
--
module E'8''5 where



import B'C'8 ( Strategy )

-- Note: Chapter 4> cabal install

import B'C'4   
 (
   Move ( Rock , Paper , Scissors )
 )

import E'8''4 ( counterUnexpected )

import Data.List ( maximum )




type IntegerTriple =  (Integer , Integer , Integer)


moveFrequencies :: [Move] -> IntegerTriple   -- ( Rock , Paper , Scissors )
moveFrequencies moves

 =  moveFrequencies' moves (0 , 0 , 0)

 where
 
 moveFrequencies' :: [Move] -> IntegerTriple -> IntegerTriple
 moveFrequencies' [] moveCountAccumulator = moveCountAccumulator
 moveFrequencies' (Rock     : remainingMoves) (rockCount , paperCount , scissorsCount) = moveFrequencies' remainingMoves (rockCount + 1 , paperCount     , scissorsCount    )
 moveFrequencies' (Paper    : remainingMoves) (rockCount , paperCount , scissorsCount) = moveFrequencies' remainingMoves (rockCount     , paperCount + 1 , scissorsCount    )
 moveFrequencies' (Scissors : remainingMoves) (rockCount , paperCount , scissorsCount) = moveFrequencies' remainingMoves (rockCount     , paperCount     , scissorsCount + 1)


mostFrequentMove :: IntegerTriple -> Move
mostFrequentMove (rockCount , paperCount , scissorsCount)

 |  maximumCount == rockCount   = Rock
 |  maximumCount == paperCount  = Paper
 |  otherwise                   = Scissors
 
 -- Note: alternatively using "case ... of" syntax.
 
 where
 
 maximumCount :: Integer
 maximumCount =  maximum [rockCount , paperCount , scissorsCount]


counterMostFrequent :: Strategy
counterMostFrequent moves

 =  case mostFrequentMove (moveFrequencies moves) of
    
	Rock      ->  Paper
	Paper     ->  Scissors
	Scissors  ->  Rock
    


{- GHCi>

let moves :: [Move] ; moves = [Rock, Paper, Scissors, Rock]

moveFrequencies moves

mostFrequentMove (moveFrequencies moves)

-}




