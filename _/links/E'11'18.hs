--
--
--
------------------
-- Exercise 11.18.
------------------
--
--
--
module E'11'18 where



curryList :: ([a] -> d) -> (a -> [a] -> d)
curryList function

 =  \item remainingItems -> function (item : remainingItems)   -- Partial anonymous function application.


{- GHCi>

curryList sum 1 [2]

-}
-- 3



uncurryList :: (a -> [a] -> d) -> ([a] -> d)
uncurryList function

 =  \(item : remainingItems) -> function item remainingItems   -- List constructor in lambda abstraction argument.
 

{- GHCi>


:{

let sum' :: Num a => a -> [a] -> a
    sum' number =  (+ number) . sum

:}

uncurryList sum' [1 , 2]

curryList (uncurryList sum') 1 [2]


-}
-- 3
-- 3



uncurryList' :: (a -> [a] -> d) -> ([a] -> d)
uncurryList' function list

 =  function (head list) (tail list)




-- Can you use "curry" and "uncurry" in defining "curryList" and "uncurryList"?
-------------------------------------------------------------------------------


-- Similar question like in 11.17, sure we could just use it for nonsense:
--
-- Using:         curry (uncurry f)  =  f
--          <=>   curry $ uncurry f  =  f


curryList' :: ([a] -> d) -> (a -> [a] -> d)
curryList' function

 =  curry $ uncurry ( \item remainingItems -> function (item : remainingItems) )


{- GHCi>

curryList' sum 1 [2]

-}
-- 3



-- But is there an interesting use case?
-- Maybe one that shows a dependency between "curryList"/"uncurryList" and "curry"/"uncurry"?


-- "curryList" and "curry":
--
-- The "curry" function is not directly applicable to the argument of "curryList" due
-- to the different typing. "([a] -> d)" doesn't match the tuple-type 
-- that is expected by "curry :: ( (a , b) -> c ) -> (a -> b -> c)".
-- Yes, we could use lambda abstractions to fix this.

{- GHCi>

let f :: [a] -> b ; f = undefined
curry f

-}
-- 
-- <interactive>:9:7:
--     Couldn't match type `[a0]' with `(a, b)'
--     Expected type: (a, b) -> c
--       Actual type: [a0] -> c
--     Relevant bindings include
--       it :: a -> b -> c (bound at <interactive>:9:1)
--     In the first argument of `curry', namely `f'
--     In the expression: curry f



-- "curryList" and "uncurry":
--
-- "uncurry" is applicable to the function argument from "curryList".
-- The application results in the type "([a] , d) -> c".
-- What do we do with this? What is about the new polymorphic "c"?


curryListUC :: ([a] -> d) -> (a -> [a] -> d)
curryListUC function a as

 =  undefined
 
 


-- "uncurryList" and "uncurry":
--
-- "uncurry :: (a -> b -> c) -> ( (a , b ) -> c )" is applicable to
-- the function argument in "uncurryList :: (a -> [a] -> d) -> ([a] -> d)". 
-- It results in "uncurry function :: ( (a , [a]) -> d ). 


uncurryListUC :: (a -> [a] -> d) -> ([a] -> d)
uncurryListUC function

 =  \(a : as) -> (uncurry function) (a , as)



-- "uncurryList" and "curry":
--
-- Similar to "curryList" and "curry".




