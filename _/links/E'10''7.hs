--
--
--
-----------------
-- Exercise 10.7.
-----------------
--
--
--
module E'10''7 where



import E'10''6 ( arePositive )




-- ( A ):
-- ------


minResult :: ( Num t , Ord t ) => (t -> t) -> [t] -> t
minResult function inputs

 = minimum ( map function inputs ) 


{- GHCi>

minResult id [ 0 , 1 ]
minResult id [ 1 , 1 ]

-}
-- 0
-- 1




-- ( B ):
-- ------


areEqualResults :: ( Num t , Ord t ) => (t -> t) -> [t] -> Bool
areEqualResults function inputs

 = areEqual ( map function inputs )
 
 where
 
 areEqual :: ( Eq t )  => [t] -> Bool
 areEqual [] = True
 areEqual [ _ ] = True
 areEqual ( predecessor : successor : remainingItems )

  = predecessor == successor && areEqual ( successor : remainingItems )


{- GHCi>

areEqualResults id []
areEqualResults id [ 0 ]
areEqualResults id [ 0 , 0 ]
areEqualResults id [ 0 , 1 ]

-}
-- True
-- True
-- True
-- False




-- ( C ):
-- ------


arePositiveResults :: ( Num t , Ord t ) => (t -> t) -> [t] -> Bool
arePositiveResults function inputs

 = arePositive ( map function inputs ) -- Using "arePositive" from ex. 10.6.


{- GHCi>


arePositiveResults id []
arePositiveResults id [  1 ]
arePositiveResults id [ -1 ]


-}
-- True
-- True
-- False




-- ( D ):
-- ------


areSortedResults :: ( Num t , Ord t ) => (t -> t) -> [t] -> Bool
areSortedResults function inputs

 = isSorted ( map function inputs ) -- Using "isSorted" from ex. 7.14.
 
 where
 
 isSorted :: ( Ord t ) => [t] -> Bool
 isSorted [] = True
 isSorted [ _ ] = True
 isSorted ( predecessor : successor : remainingListItems )
 
  = predecessor <= successor && isSorted ( successor : remainingListItems )


{- GHCi>

areSortedResults id []
areSortedResults id [ 0 , 1 ]
areSortedResults id [ 1 , 0 ]

-}
-- True
-- True
-- False




