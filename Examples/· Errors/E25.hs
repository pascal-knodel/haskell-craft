module E25 where



definition :: [a] -> Bool
definition list

 = list
 
 where
 
 list' :: [a]
 list' = reverse list


 
{-


-- A possible fix:


definition :: [a] -> Bool
definition list

 = list
 
 where
 
 list' = reverse list

 
-}