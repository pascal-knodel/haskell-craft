--
--
--
----------------
-- Exercise 5.3.
----------------
--
--
--
module E'5''3 where



--                   a * x  +  b      =  0
-- (a is not 0) =>       x  +  b / a  =  0
--              =>       x            =  -  b / a

xIntercept :: (Float, Float) -> (Float, Bool)
xIntercept ( a , b )

 |  a == 0     = (          0 , False )
 |  otherwise  = ( -( b / a ) , True  )


{- GHCi>

xIntercept ( 0 , 0 )
xIntercept ( 1 , 0 )
xIntercept ( 10e1000 , 1 )
xIntercept ( 1 , -1 )

-}
-- (  0.0 , False )
-- ( -0.0 , True  )
-- ( -0.0 , True  )
-- (  1.0 , True  )




