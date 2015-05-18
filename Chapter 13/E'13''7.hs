--
--
--
-----------------
-- Exercise 13.7.
-----------------
--
--
--
module E'13''7 where



import Prelude hiding
 (
   compare
 )
import B'C'13




-- "size x" and "size y" will be of type "Info a" and "Info b".
-- "size" is of type "Int". To get the most general type it is
-- not important that the polymorphic type variables are identical,
-- because size takes this dependency away.


-- compare :: (Info a, Info b) => a -> b -> Bool
compare x y =  size x <= size y


-- GHCi> :t compare
-- compare :: (Info a1, Info a) => a -> a1 -> Bool




