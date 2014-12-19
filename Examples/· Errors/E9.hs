module E9 where



data MyType =   TypeOne String
              | TypeTwo String

definition :: MyType -> Bool
definition (TypeOne _) = True


other_Definition :: Bool
other_Definition = True


definition (TypeTwo _) = True



         
{-

data MyType =   TypeOne String
              | TypeTwo String

definition :: MyType -> Bool
definition (TypeOne _) = True
definition (TypeTwo _) = True

other_Definition :: Bool
other_Definition = True
              
-}