module E19 where



import Prelude hiding (sum)




sum :: [Int] -> Int
sum [] = 0
sum (i : is)

 = i + (sum is)
 
 
preludeSum :: [Int] -> Int
preludeSum is = Prelude.sum is



{-

import Prelude hiding (sum)
import qualified Prelude (sum)




sum :: [Int] -> Int
sum [] = 0
sum (i : is)

 = i + (sum is)
 
 
preludeSum :: [Int] -> Int
preludeSum is = Prelude.sum is

-}