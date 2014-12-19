module E7 where



definition :: Integer -> Integer
definition anInteger

         | even anInteger = anInteger / 2
         | otherwise      = 0



         
{-

definition :: Integer -> Integer
definition anInteger

         | even anInteger = anInteger `div` 2
         | otherwise      = 0
              
-}