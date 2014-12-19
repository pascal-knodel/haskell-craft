--
--
--
------------------
-- Exercise 10.15.
------------------
--
--
--
module E'10'15 where



import Prelude hiding
 ( unzip
 , last
 , init
 )
import qualified Prelude
 ( unzip
 , last
 , init
 )

import Test.QuickCheck
 ( Property
 , (==>)
 , quickCheck
 )




-- "unzip":
-- --------


unzip :: [(t, t)] -> ([t], [t])
unzip pairs

 = foldr unzipPair ( [] , [] ) pairs
 
 where
 
 unzipPair :: (t , t) -> ([t], [t]) -> ([t], [t])
 unzipPair pair lists = let ( firstComponent     , secondComponent     ) = pair
                            ( firstComponentList , secondComponentList ) = lists
                    
                        in  ( firstComponent : firstComponentList , secondComponent : secondComponentList )


{- GHCi>

unzip  []
unzip  [ ( 0 , 0 ) ]
unzip  [ ( 0 , 0 ) , ( 1 , 1 ) ]

-}
-- ( [] , [] )
-- ( [ 0 ] , [ 0 ] )
-- ( [ 0 , 1 ] , [ 0 , 1 ] )


prop_unzip :: [ (Integer , Integer) ] -> Bool
prop_unzip pairs

 = unzip pairs == Prelude.unzip pairs


-- GHCi> quickCheck prop_unzip




-- "last":
-- -------


-- Using "foldr1" -------------------


last :: [t] -> t
last list

 = foldr1 keepLast list
 
 where
 
 keepLast :: t -> t -> t
 keepLast _ lastItem = lastItem


{- GHCi>

last []
last [ 0 ]
last [ 0 , 1 ]

-}
-- *** Exception: Empty list.
-- 0
-- 1



prop_last :: [Integer] -> Property
prop_last list

 =     list /= []
   ==> last list == Prelude.last list


-- GHCi> quickCheck prop_last


-------------------------------------



-- Using "foldr" ---------------------------------


-- Thoughts ...


primitiveLast :: [t] -> t
primitiveLast list

 = takeFirst ( last list )

 where
 
 last :: [t] -> [t]
 last [] = []
 last ( item : remainingItems )
 
  = item `keepLast` last remainingItems
 
 keepLast :: t -> [t] -> [t]
 keepLast lastItem [] = [ lastItem ]
 keepLast _ [ lastItem ] = [ lastItem ]
 
 takeFirst :: [t] -> t
 takeFirst [] = error "Empty list."
 takeFirst ( item : _ ) = item


{- GHCi>

primitiveLast []
primitiveLast [ 0 ]
primitiveLast [ 0 , 1 ]

-}
-- *** Exception: Empty list.
-- 0
-- 1


-- ...


last' :: [t] -> t
last' list

 = takeFirst ( foldr keepLast [] list )
 
 where
 
 keepLast :: t -> [t] -> [t]
 keepLast lastItem [] = [ lastItem ]
 keepLast _ ( successor : _ ) = [ successor ]
 
 takeFirst :: [t] -> t
 takeFirst [] = error "Empty list."
 takeFirst ( item : _ ) = item


{- GHCi>

last' []
last' [ 0 ]
last' [ 0 , 1 ]

-}
-- *** Exception: Empty list.
-- 0
-- 1


prop_last' :: [Integer] -> Property
prop_last' list

 =     list /= []
   ==> last' list == Prelude.last list


-- GHCi> quickCheck prop_last'


--------------------------------------------------




-- "init":
-- -------


-- Using "foldr" ---------------------------------------------------------------------------


-- Thoughts ...


primitiveInit :: [t] -> [t]
primitiveInit list

 = dropFirst ( init list )

 where

 init :: [t] -> [t]
 init [] = []
 init ( item : remainingItems )

  = item `shiftLastToFirst` init remainingItems

 shiftLastToFirst :: t -> [t] -> [t]
 shiftLastToFirst lastItem [] = [ lastItem ]
 shiftLastToFirst predecessor ( lastItem : predecessors ) = lastItem : predecessor : predecessors
 
 dropFirst :: [t] -> [t]
 dropFirst [] = error "Empty list."
 dropFirst ( _ : remainingItems ) = remainingItems


{- GHCi>

primitiveInit []
primitiveInit [ 0 ]
primitiveInit [ 0 , 1 ]

-}
-- *** Exception: Empty list.
--[]
-- [ 0 ]


-- ...


init' :: [t] -> [t]
init' list

 = dropFirst ( foldr shiftLastToFirst [] list )
 
 where
 
 shiftLastToFirst :: t -> [t] -> [t]
 shiftLastToFirst lastItem [] = [ lastItem ]
 shiftLastToFirst predecessor ( lastItem : predecessors ) = lastItem : predecessor : predecessors
 
 dropFirst :: [t] -> [t]
 dropFirst [] = error "Empty list."
 dropFirst ( _ : remainingItems ) = remainingItems


{- GHCi>

init' []
init' [ 0 ]
init' [ 0 , 1 ]

-}
-- *** Exception: Empty list.
--[]
-- [ 0 ]


prop_init' :: [Integer] -> Property
prop_init' list

 =     list /= []
   ==> init' list == Prelude.init list


-- GHCi> quickCheck prop_init'


--------------------------------------------------------------------------------------------




