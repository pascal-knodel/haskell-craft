{-# OPTIONS_GHC -XFlexibleInstances #-}
--
--
--
-----------------
-- Exercise 13.5.
-----------------
--
--
--
module E'13''5 where



import B'C'13




instance Info (Int -> Bool) where

 examples =  [ \i -> i == 1 ]
 size _   =  1


-- GHCi> size ( \i -> i == (1 :: Int) )
-- 1



instance Info (Int -> Int) where

 examples =  [ \i -> i :: Int ]
 size _   =  1


-- GHCi> size ( (examples :: [Int -> Int] ) !! 0)
-- 1




