module E11 where



data MyType =   MyDataOne
              | MyDataTwo
              -- ...
              deriving (Eq, Show {- , ... -})

              
instance Eq MyType where

         MyDataOne == MyDataTwo = True



{-

data MyType =   MyDataOne
              | MyDataTwo
              -- ...
              deriving (Show {- , ... -})

              
instance Eq MyType where

         MyDataOne == MyDataTwo = True
              
-}