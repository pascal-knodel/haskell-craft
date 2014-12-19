--
-- Chapter 6, definitions from the book.
--
module B'C'6 where



import Pictures ( Picture )




-- Subchapter 6.6:


type Position =  ( Integer , Integer )


type Image =  ( Picture , Position )



-- Subchapter 6.7 (exercise relevant definitions) ...


type Name    =  String
type Price   =  Int
type BarCode =  Int

type Database =  [ ( BarCode , Name , Price ) ]


codeIndex :: Database
codeIndex =  [ 
               ( 4719 , "Fish Fingers"       , 121  ) ,
               ( 5643 , "Nappies"            , 1010 ) ,
               ( 3814 , "Orange Jelly"       , 56   ) ,
               ( 1111 , "Hula Hoops"         , 21   ) ,
               ( 1112 , "Hula Hoops (Giant)" , 133  ) ,
               ( 1234 , "Dry Sherry, 1lt"    , 540  )
             ]

              
type TillType =  [BarCode]
type BillType =  [ ( Name , Price ) ]


lineLength :: Int
lineLength =  30




