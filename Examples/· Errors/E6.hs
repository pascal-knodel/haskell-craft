module E6 where



condition :: Bool
condition = False -- Example.


definition argument
         
         | condition = True
         | otherwise = True


otherDefinition otherArgument

              | condition = False
              | otherwise = False

         
{-

-- Logical error. Possible solution:

condition :: Bool
condition = False -- Example.


definition argument
         
         | condition = True
         | otherwise = False
         
         
otherDefinition otherArgument

              | condition = False
              | otherwise = True
              
-}