--
--
--
-----------------
-- Exercise 13.2.
-----------------
--
--
--
module E'13''2 where



import Data.List
 (
   foldl'
 )




-- What is the type of your function?
-------------------------------------
--
-- Because there is a need to compare each element from the list with
-- the given reference element, we have to apply the type class "Eq".
-- The reference element is or is not in the list. Lists are homogenous
-- in Haskell, this is why we have not other chance then letting the
-- element and the reference elements have the same type "a".


numEqual :: Eq a => a -> [a] -> Int
numEqual x

 =  length . filter (== x)


{- GHCi>

let x = 1
let xs = [0,1,2]
numEqual x xs

-}
-- 1

-- GHCi> :t numEqual
-- numEqual :: Eq a => a -> [a] -> Int




-- Other solutions for "numEqual":


-- numEqual' :: Eq a => a -> [a] -> Integer
numEqual' x

 =  foldr (\a b -> 1 + b) 0 . filter (== x)


-- GHCi> :t numEqual'
-- numEqual' :: (Num c, Eq a) => a -> [a] -> c

-- Note: A type annotation ":: Integer" at "0"
--       would have resulted in the output being a "Integer".



-- numEqual'' :: Eq a => a -> [a] -> Integer
numEqual'' x

 =  foldl' (\a b -> a + 1) 0 . filter (== x)


-- GHCi> :t numEqual''
-- numEqual'' :: (Num c, Eq a) => a -> [a] -> c


{- GHCi>

let x = '0'
let xs = show $ 10^9
numEqual'' x xs

-}
-- 9




-- How could you use "numEqual" to define "member"?
---------------------------------------------------


member :: Eq a => [a] -> a -> Bool
member xs x

 =  numEqual x xs > 0


-- Note: inefficient, because "numEqual" will compute all occurences of "x" in "xs"
--       but one would be sufficient to make a statement about "x" beeing a member of "xs"
--       in the case that "x" is in "xs". We should use another definition in real world
--       which takes care of at least the one optimization I just noted.


-- GHCi> member "010" '1'
-- True




