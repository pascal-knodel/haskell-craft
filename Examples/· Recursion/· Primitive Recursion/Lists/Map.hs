-- Map a function to every list item.
module Map where



import Prelude hiding (map)



map :: -- See hidden imports.
          ( function_argument_type -> function_result_type ) -- The function. 
       -> [ function_argument_type ] -- List with inputs for the function.
       -> [ function_result_type   ] -- List with outputs from the function.
       
map function [] = []
map function (listItem : remainingListItems)

 = function listItem : map function remainingListItems




{- GHCi>


:{
   let increment :: Integer -> Integer ;
       increment integer = integer + 1
:}

map increment [ 0, 1 ]


-}
-- [ 1, 2 ]


