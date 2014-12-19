module E18 where



sum :: [Int] -> Int
sum [] = 0
sum (i : is)

 = i + (sum is)



{-

import Prelude hiding (sum)




sum :: [Int] -> Int
sum [] = 0
sum (i : is)

 = i + (sum is)

-}