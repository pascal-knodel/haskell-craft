--
--
--
------------------
-- Exercise 10.21.
------------------
--
-- 
--
module E'10'21 where




split :: [a] -> ([a] , [a])
split [] = ( [] , [] )
split [ a1 ] = ( [ a1 ] , [] )
split ( a1 : a2 : rest )

 =  let ( l , r ) = ( split rest ) in ( a1 : l , a2 : r )
 


merge :: ([a] , [a]) -> [a]
merge ( [] , [] ) = []
merge ( [ a1 ] , [] ) = [ a1 ]
merge ( a1 : l , a2 : r )

 =  a1 : a2 : merge ( l , r )




{- GHCi>

split [         1 ]
split [     1 , 2 ]
split [ 1 , 2 , 3 ]

merge ( [     1 ] , [   ] )
merge ( [     1 ] , [ 2 ] )
merge ( [ 1 , 3 ] , [ 2 ] )

-}
-- ( [     1 ] , [   ] )
-- ( [     1 ] , [ 2 ] )
-- ( [ 1 , 3 ] , [ 2 ] )
--
-- [         1 ]
-- [     1 , 2 ]
-- [ 1 , 2 , 3 ]




