module SplitWhen where



splitWhen :: (t -> Bool) -> [t] -> ([t] , [t])
splitWhen _ [] = ([] , [])
splitWhen predicate (item : items)

 | predicate item = ([] , item : items)
 | otherwise      = let (leftItems , rightItems) = splitWhen predicate items
                    in  (item : leftItems , rightItems)


{- GHCi>


splitWhen even [1, 1, 2, 3]


-}
-- ( [1,1] , [2,3] )


-- Example calculation: splitWhen even [1, 1, 2, 3]
--
--               
--   splitWhen even [1, 1, 2, 3]
-- = splitWhen even (1 : [1, 2, 3])
--   ??   even 1
--   ?? = False
--   ?? otherwise
-- = let (lis, ris) = splitWhen even [1, 2, 3] in (1 : lis, ris)
-- = let (lis, ris) = (   
--                      splitWhen even [1, 2, 3]
--                    = splitWhen even (1 : [2, 3]) 
--                      ??   even 1
--                      ?? = False
--                      ?? otherwise
--                    = let (lis, ris) = splitWhen even [2, 3] in (1 : lis, ris)
--
--                  ) in (1 : lis, ris)
--
-- = let (lis, ris) = ( let (lis, ris) = splitWhen even [2, 3] in (1 : lis, ris) ) in (1 : lis, ris)
-- = let (lis, ris) = ( let (lis, ris) = (
--                                       splitWhen even [2, 3]
--                                     = splitWhen even 2 : [3]
--                                       ??   even 2
--                                       ?? = True
--                                     = ([], 2 : [3])
--                                     = ([], [2, 3])
--
--                                   ) in (1 : lis, ris) ) in (1 : lis, ris)
--
-- = let (lis, ris) = ( let (lis, ris) = ([], [2, 3]) in (1 : lis, ris) ) in (1 : lis, ris)
-- = let (lis, ris) = ([1], [2,3]) in (1 : lis, ris)
-- = ([1,1], [2,3])


