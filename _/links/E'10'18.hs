--
--
--
------------------
-- Exercise 10.18.
------------------
--
--
--
module E'10'18 where




filterFirst :: (a -> Bool) -> [a] -> [a]
filterFirst _ [] = []
filterFirst predicate ( item : remainingItems )

 | not ( predicate item ) = remainingItems
 | otherwise              = item : filterFirst predicate remainingItems


{- GHCi>

:{
   let isZero :: Integer -> Bool ;
       isZero integer = integer == 0
:}

filterFirst isZero [ 0 , 1 , 2 , 0 ]

-}
-- [ 0 , 2 , 0 ]



-- From chapter 5 ...


type Person = String
type Book   = String

type Loan = ( Person , Book )

type Database = [ Loan ]


-- ...



returnLoan :: Database -> Loan -> Database
returnLoan database referenceLoan

 = filterFirst isLoan database
 
 where
 
 isLoan :: Loan -> Bool
 isLoan loan = loan == referenceLoan
 

{- GHCi>

:{
   let database :: Database ;
       database = [ 
                    ( "P1" , "B1" ) ,
                    ( "P2" , "B1" ) ,
                    ( "P3" , "B2" )
                  ]
:}

returnLoan database ( "P2" , "B1" )

-}
-- [ 
--   ( "P2" , "B1" ) ,
--   ( "P3" , "B2" )
-- ]




