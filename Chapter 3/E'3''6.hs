--
--
--
----------------
-- Exercise 3.6.
----------------
--
--
--
module E'3''6 where



import E'3''5 ( nAnd , nAnd2 )



-- Definitions from ex. 3.5:
--
--
-- nAnd :: Bool -> Bool -> Bool
-- nAnd True True = False
-- nAnd True False = True
-- nAnd False True = True
-- nAnd False False = True
-- 
-- 
-- nAnd2 :: Bool -> Bool -> Bool
-- nAnd2 True True = False
-- nAnd2 a b = True
--
--
-- ...



--       nAnd True True
--      ??      True True
--      ??  ~>  True
--  ~>   False


--       nAnd True False
--      ??      True True
--      ??  ~>  False
--      ??      True False
--      ??  ~>  True
--  ~>   True



--       nAnd2 True True
--      ??      True True
--      ??  ~>  True
--  ~>   False


--       nAnd2 True False
--      ??      True True
--      ??  ~>  False
--      ??      a b
--      ??  ~>  True
--  ~>   True




{- GHCi>

nAnd True True
nAnd True False
nAnd2 True True
nAnd2 True False

-}
-- False
-- True
-- False
-- True




