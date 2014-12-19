module E23 where



data AT = A deriving (Read, Show)

data BT = B AT deriving (Read, Show)

data CT = C AT deriving (Read, Show)



definition :: BT -> CT -> Bool
definition (B a) (C a) = True 


 

 
{-


-- Logical problem: the a's are intended to be the same.
-- Solution: ?

 
-}