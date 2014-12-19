-- Zip a list-triple to a list of triples.
module Zip where



import Prelude hiding (zip)

zip :: ( [a] , [b] , [c] ) -> [ (a , b , c) ]
zip ( [] , _  , _  ) = []
zip ( _  , [] , _  ) = []
zip ( _  , _  , [] ) = []
zip (
      firstComponent  : remainingFirstComponents  ,
      secondComponent : remainingSecondComponents ,
      thirdComponent  : remainingThirdComponents
    )

 =       ( firstComponent , secondComponent , thirdComponent )
 
   : zip ( remainingFirstComponents , remainingSecondComponents , remainingThirdComponents )



-- GHCi>
-- zip ( [1] , [2] , [3] )
-- [ (1 , 2 , 3) ]


-- GHCi> zip ( [11, 21] , [12, 22] , [13, 31] )
-- [ ( 11 , 12 , 13 ) , ( 21 , 22 , 31 ) ]


{- GHCi>


:{
   zip (
         [ "First component of the first triple."  , "First component of the second triple."  , "..."] ,
         [ "Second component of the first triple." , "Second component of the second triple." , "..."] ,
         [ "Third component of the first triple"   , "Third component of the second triple"   , "..."]
       )
:}


-}
-- [ 
--   ( "First component of the first triple."  , "Second component of the first triple."  , "Third component of the first triple"  ) ,
--   ( "First component of the second triple." , "Second component of the second triple." , "Third component of the second triple" ) ,
--   ( "..."                                   , "..."                                    , "..."                                  )
-- ]


