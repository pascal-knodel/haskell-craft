--
--
--
------------------
-- Exercise 10.36.
------------------
--
-- 
--
module E'10'36 where




-- From subchapter 4.3, Rock - Paper - Scissors ...


data Move

 =    Rock
    | Paper
    | Scissors
   
     deriving Eq


instance Show Move 

 where
 
 show Rock     =  "R"
 show Paper    =  "P"
 show Scissors =  "S"


beat :: Move -> Move
beat Rock     =  Paper
beat Paper    =  Scissors
beat Scissors =  Rock


lose :: Move -> Move
lose Rock  =  Scissors
lose Paper =  Rock
lose _     =  Paper


-- From ex. 4.11 ...


data Result

 =    Win
    | Lose
    | Draw
   
    deriving Eq


-- Make it possible to "show" a Result:

instance Show Result 

 where
         
 show Win  =  "W"
 show Lose =  "L"
 show Draw =  "D"

-- Ignore this, for now.


-- From ex. 4.12 ...
 
outcome' :: Move -> Move -> Result
outcome' firstPlayerMove secondPlayerMove

 |  firstPlayerMove == ( beat secondPlayerMove ) =  Win
 |  firstPlayerMove == ( lose secondPlayerMove ) =  Lose
 |                                     otherwise =  Draw


-- From ex. 8.1 ...


outcome :: Move -> Move -> Integer
outcome firstPlayerMove secondPlayerMove

 =  case ( outcome' firstPlayerMove secondPlayerMove ) of
   
    Win  ->  1
    Draw ->  0
    Lose -> -1


-- From subchapter 8.1 ...


type Tournament =  ( [Move] , [Move] )


-- ...



tournamentOutcome :: Tournament -> Integer
tournamentOutcome ( firstPlayerMoves , secondPlayerMoves )

 =  sum ( zipWith outcome firstPlayerMoves secondPlayerMoves )


{- GHCi>

tournamentOutcome ( [] , [] )
tournamentOutcome (  [ Rock , Rock , Paper ] , [ Scissors , Paper , Rock ]  )

-}
-- 0
-- 1




