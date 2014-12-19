--
--
--
------------------
-- Exercise 10.20.
------------------
--
-- 
--
module E'10'20 where




switchMap fun1 fun2 [] = []
switchMap fun1 _    [      a1 ] = ( fun1 a1 ) :               []
switchMap fun1 fun2 [ a1 , a2 ] = ( fun1 a1 ) : ( fun2 a2 ) : []
switchMap fun1 fun2 ( a1 : a2 : rest )

 =  ( fun1 a1 ) : ( fun2 a2 ) : ( switchMap fun1 fun2 rest )



-- Type of "switchMap" according to a first guess:

switchMap' :: (a -> a) -> (a -> a) -> [a] -> [a]
switchMap' = switchMap



-- Most general type of "switchMap" according to GHCi type inference:

-- GHCi> :t switchMap
switchMap :: (t -> a) -> (t -> a) -> [t] -> [a]



{- GHCi>

let addOne a = a +  1
let addTen a = a + 10

switchMap addOne addTen [               ]
switchMap addOne addTen [             1 ]
switchMap addOne addTen [         1 , 2 ]
switchMap addOne addTen [     1 , 2 , 3 ]
switchMap addOne addTen [ 1 , 2 , 3 , 4 ]

-}




