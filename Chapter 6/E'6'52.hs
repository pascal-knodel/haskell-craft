--
--
--
-----------------
-- Exercise 6.52.
-----------------
--
--
--
module E'6'52 where



import B'C'6
 (
   TillType
 , Database
 , BarCode
 , Name
 , lineLength
 )

import E'6'44 ( formatTitle )
import E'6'45 ( look )

import Data.List ( concat )

import GHC.List ( elem )




type Sales =  Int


makeSalesReport :: TillType -> Database -> String
makeSalesReport barCodes database

 =      (formatTitle title)   -- formatTitle, see ex. 6.44.
    ++  (formatLines'' nameSalesPairs)
 
 where
 
 title :: String
 title =  "Sales"
 
 barCodesOnce :: [BarCode]
 barCodesOnce =  removeReplicatives barCodes
 
 barCodesOnceCountings :: [BarCode]
 barCodesOnceCountings =  [ countReplicatives barCode barCodes | barCode <- barCodesOnce ]
 
 totalSales :: [(BarCode, Sales)]
 totalSales =  zip barCodesOnce barCodesOnceCountings
 
 nameSalesPairs :: [ (Name, Sales) ]
 nameSalesPairs =  [ ( fst (look database barCode) , sales ) | (barCode , sales) <- totalSales ]
 

removeReplicatives :: Eq t => [t] -> [t] -- Naive.
removeReplicatives [] = []
removeReplicatives (firstItem : remainingItems)

 |  isReplicative firstItem remainingItems  =             removeReplicatives remainingItems
 |  otherwise                               = firstItem : removeReplicatives remainingItems

 where
 
 isReplicative :: Eq t => t -> [t] -> Bool -- Naive.
 isReplicative item list
 
  =  item `elem` list


countReplicatives :: Eq t => t -> [t] -> Int
countReplicatives item [] = 0
countReplicatives item (comparisonItem : remainingComparisonItems)

 |  item == comparisonItem  = 1 + countReplicatives item remainingComparisonItems
 |  otherwise               =     countReplicatives item remainingComparisonItems


formatLine'' :: (Name, Sales) -> String
formatLine'' (name, sales)

 =  name ++ fillCharacters ++ sales' ++ "\n"
 
 where
 
 nonFillCharacterCount :: Int
 nonFillCharacterCount =  (length name) + (length sales') -- Definition: "\n" (white space) doesn't count.
 
 numberOfFillCharacters :: Int
 numberOfFillCharacters =  lineLength - nonFillCharacterCount -- lineLength, see ex. 6.39.
 
 fillCharacters :: String
 fillCharacters =  replicate numberOfFillCharacters ' '
 
 sales' :: String
 sales' =  show sales


formatLines'' :: [ (Name, Sales) ] -> String
formatLines'' nameSalesPairs

 =  concat (map formatLine'' nameSalesPairs)
 
 
exampleDatabase :: Database
exampleDatabase

 =  [ 
      (  1 , "Hs. Reference Book"       ,    100 ) ,
      (  2 , "Hs. Reference Cards"      ,    100 ) ,
      (  3 , "Hs. Reference Poster"     ,    100 ) ,
      (  4 , "Hs. Learning Book LB1"    ,  10000 ) ,
      (  5 , "Hs. LB1 Solutions"        ,    100 ) ,
      (  6 , "Hs. Learning Book LB2"    ,   1000 ) ,
      (  7 , "Hs. Learning Cards"       ,    100 ) ,
      (  8 , "Hs. Editor"               ,    100 ) ,
      (  9 , "Hs. IDE"                  ,   1000 ) ,
      ( 10 , "Hs. Expression Evaluator" ,    100 ) ,
      ( 11 , "Hs. Calculator"           ,    100 ) ,
      ( 12 , "Hs. to C Converter"       ,    100 ) ,
      ( 13 , "Hs. Sorting Library"      ,    100 ) ,
      ( 14 , "Functional Processor FP1" ,   1000 ) ,
      ( 15 , "Functional Processor FP2" ,  10000 ) ,
      ( 16 , "Functional Processor FP3" , 100000 )
    ]
            

{- GHCi>


:{
   putStr (
            makeSalesReport [
                              -- Known items:
                               4, 4,
                               5, 5,
                               7,
                               8,
                              10
                            ]
                            exampleDatabase
          )
:}


-}
-- 
--             Sales
-- 
-- Hs. Learning Book LB1        2
-- Hs. LB1 Solutions            2
-- Hs. Learning Cards           1
-- Hs. Editor                   1
-- Hs. Expression Evaluator     1


{- GHCi>


:{
   putStr (
            makeSalesReport [ 
                              -- Unknown items:
                              -1,
                              -2,
                              -3
                            ]
                            []
          )
:}


-}
-- 
--             Sales
-- 
-- Unknown Item                 1
-- Unknown Item                 1
-- Unknown Item                 1




