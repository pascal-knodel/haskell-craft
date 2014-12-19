--
--
--
-----------------
-- Exercise 4.10.
-----------------
--
--
--
module E'4'10 where




--     maxThreeOccurs 4 5 5
--  =  ( maximum , occurrences )
--  .
--  .  where
--  .
--  .      maximum
--  .   =  fromInteger ( maxThree ( toInteger 4 ) ( toInteger 5 ) ( toInteger 5 ) )
--  .  ~>  fromInteger ( max ( max 4 5 ) 5 )
--  .  ~>  fromInteger ( max 5 5 )
--  .  ~>  fromInteger 5
--  .  ~>  5
--  .
--  .       occurrences
--  .   =   occurs 5 4 5 5
--  .      ??
--  .      ??      4 == 5  &&  ...
--  .      ??  ~>  False   &&  ...
--  .      ??  ~>  False
--  .      ??
--  .      ??      ( 4 == 5  &&  ... )  ||  ...
--  .      ??  ~>  ( False   &&  ... )  ||  ...
--  .      ??  ~>  False                ||  ...
--  .      ??  ~>  False                ||  ( 4 == 5  &&  ... )  ||  ...
--  .      ??  ~>  False                ||  ( False   &&  ... )  ||  ...
--  .      ??  ~>  False                ||  False                ||  ...
--  .      ??  ~>  False                ||  False                ||  ( 5 == 5  &&  ..     )
--  .      ??  ~>  False                ||  False                ||  ( True    &&  ...    )
--  .      ??  ~>  False                ||  False                ||  ( True    &&  5 == 5 )
--  .      ??  ~>  False                ||  False                ||  ( True    &&  True   )
--  .      ??  ~>  False                ||  False                ||  True
--  .      ??  ~>  True
--  .      ??
--  .  ~>  2
--  .
--  =  ( 5       , 2           )




--     maxThreeOccurs 4 5 4
--  =  ( maximum , occurrences )
--  .
--  .  where
--  .
--  .      maximum
--  .  ~>  fromInteger ( maxThree ( toInteger 4 ) ( toInteger 5 ) ( toInteger 4 ) )
--  .  ~>  fromInteger ( max ( max 4 5 ) 4 )
--  .  ~>  fromInteger ( max 5 4 )
--  .  ~>  fromInteger 5
--  .  ~>  5
--  .
--  .       occurrences
--  .   =   occurs 5 4 5 4
--  .      ??
--  .      ??      4 == 5  &&  5 == 5  &&  4 == 5
--  .      ??  ~>  False && ...
--  .      ??  ~>  False
--  .      ??
--  .      ??      ( 4 == 5  &&  ... )  ||  ...
--  .      ??  ~>  ( False   &&  ... )  ||  ...
--  .      ??  ~>  False                ||  ...
--  .      ??  ~>  False                ||  ( 4 == 5  &&  ... )  ||  ...
--  .      ??  ~>  False                ||  ( False   &&  ... )  ||  ...
--  .      ??  ~>  False                ||  False                ||  ...
--  .      ??  ~>  False                ||  False                ||  ( 5 == 5  &&  ...    )
--  .      ??  ~>  False                ||  False                ||  ( True    &&  ...    )
--  .      ??  ~>  False                ||  False                ||  ( True    &&  4 == 5 )
--  .      ??  ~>  False                ||  False                ||  ( True    &&  False  )
--  .      ??  ~>  False                ||  False                ||  False
--  .      ??  ~>  False                ||  False
--  .      ??  ~>  False
--  .      ??
--  .      ??  otherwise
--  .      ??
--  .  ~>  2
--  .
--  =  ( 5       , 1           )




