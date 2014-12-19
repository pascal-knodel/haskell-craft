--
--
--
----------------
-- Exercise 3.9.
----------------
--
--
--
module E'3''9 where




threeDifferent :: Integer -> Integer -> Integer -> Bool
threeDifferent a b c

 =      a /= b
    &&  a /= c
    &&  b /= c

-- Note: "threeDifferent" is not like "not threeEqual".



-- GHCi> threeDifferent 3 4 3
-- False


--      threeDifferent 3 4 3
--
--  ~>  3 /= 4  &&  ...
--  ~>    True  &&  3 /= 3  &&  ...
--  ~>    True  &&  False   &&  ...
--  ~>    True  &&  False
--  ~>  False




