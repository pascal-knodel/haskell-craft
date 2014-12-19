module Unzip where



import Prelude ()



unzip :: [(a, b)] -> ([a] , [b])
unzip [] = ([] , [])
unzip ((leftItem , rightItem) : remainingItems)

 = let (remainingLeftItems , remainingRightItems) = (unzip remainingItems)
   in  (leftItem : remainingLeftItems , rightItem : remainingRightItems)



{- GHCi>


:{
   unzip [ 
           ('l', 'r'), 
           ('e', 'i'), 
           ('f', 'g'), 
           ('t', 'h'), 
           (' ', 't')
         ] 
:}


-}
-- ( "left " , "right" )


