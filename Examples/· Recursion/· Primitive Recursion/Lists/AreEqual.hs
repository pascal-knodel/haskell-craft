-- Are all items in a list equal to each other?
module AreEqual where



areEqual :: ( Eq t )  => [t] -> Bool
areEqual [] = True
areEqual [ _ ] = True
areEqual ( predecessor : successor : remainingItems )

 = predecessor == successor && areEqual ( successor : remainingItems )



{- GHCi>


areEqual []
areEqual [ 0 ]
areEqual [ 0 , 0 ]
areEqual [ 0 , 1 ]


-}
-- True
-- True
-- True
-- False


