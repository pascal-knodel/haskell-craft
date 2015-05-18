--
--
--
-----------------
-- Exercise 13.3.
-----------------
--
--
--
module E'13''3 where



oneLookupFirst :: Eq a => [ (a,b) ] -> a -> b
oneLookupFirst [] _ =  error "Tuple'less list."
oneLookupFirst abs a

 =  ( snd . head . filter ( \(c , _) -> c == a) ) abs

-- GHCi> oneLookupFirst [ ("No Love","Sadness") , ("Love","Happyness") ] "Love"
-- "Happyness"


oneLookupSecond :: Eq b => [ (a,b) ] -> b -> a
oneLookupSecond [] _ =  error "Tuple'less list."
oneLookupSecond abs b

 =  ( fst . head . filter ( \(_ , c) -> c == b) ) abs

-- GHCi> oneLookupSecond [ ("Love","Sadness") , ("No Love","Happyness") ] "Happyness"
-- "No Love"




-- other solution for "oneLookupFirst", "oneLookupSecond":


oneLookupFirst' :: Eq a => [ (a,b) ] -> a -> b
oneLookupFirst' [] _ =  error "Tuple'less list."
oneLookupFirst' abs a

 =  head [ b | (c , b) <- abs , c == a ]


oneLookupSecond' :: Eq b => [ (a,b) ] -> b -> a
oneLookupSecond' [] _ =  error "Tuple'less list."
oneLookupSecond' abs b

 =  head [ a | (a , c) <- abs , c == b ]


{- GHCi>

oneLookupFirst' [ ("No Love","Sadness") , ("Love","Happyness") ] "Love"

oneLookupSecond' [ ("Love","Sadness") , ("No Love","Happyness") ] "Happyness"

-}
-- "Happyness"
--
-- "No Love"




