--
-- Chapter 4, definitions from the book.
--
module B'C'4 where



import Test.QuickCheck   -- Note: Because of "Arbitrary".




-- From subchapter 4.3, Rock - Paper - Scissors ...


data Move

 =   Rock
   | Paper
   | Scissors
   
   deriving Eq


instance Show Move 

 where
 
 show Rock     =  "R"
 show Paper    =  "P"
 show Scissors =  "S"


instance Arbitrary Move

 where
 
 arbitrary =  elements [ Rock , Paper , Scissors ]


beat :: Move -> Move
beat Rock     = Paper
beat Paper    = Scissors
beat Scissors = Rock


lose :: Move -> Move
lose Rock  = Scissors
lose Paper = Rock
lose _     = Paper


-- ...




