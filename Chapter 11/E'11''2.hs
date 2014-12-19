--
--
--
-----------------
-- Exercise 11.2.
-----------------
--
--
--
module E'11''2 where



import Prelude hiding ( id )




id :: a -> a
id x =  x


f :: Int -> Bool   -- Example "f":
f 0 =  False
f 1 =  True
f _ =  undefined



-- Behaviour and type instance of  "(id . f)"  :
------------------------------------------------
--
-- "(id . f)" means first apply "f", then apply "id". The application
-- of "f" results in a ":: Bool". Therefore the instance of the most general
-- type of "id" has to be "Bool -> Bool". "(id . f)" returns a function and its
-- effect is the same as if we would just use "f".
--
-- The most important fact here is: function application binds more tightly
-- than function composition.

-- GHCi> (id . f) 0
-- False



-- Behaviour and type instance of  "(f . id)"  :
------------------------------------------------
--
-- "(f . id)" means first apply "id", then apply "f". Because "f"
-- needs an argument of type ":: Int", the expression is only correctly typed,
-- if the inner function results in an integer. Therefore the instance 
-- of the most general type of "id" has to be "Int -> Int". (f . id) returns
-- a function and its effect is the same as if we would just use "f".
--
-- The most important fact here is: function application binds more tightly
-- than function composition.

-- GHCi> (f . id) 0
-- False



-- Behaviour and type instance of  "id f"  :
--------------------------------------------
--
-- It is just a function application.
--
-- The identity of a function is the function itself.
-- Not just in mainstream mathematics / year 2014,
-- in Haskell too:
--
--   Proposition:   ( id f )  =  f
--
--
--         Proof:      ( id f )
--                                | id
--                  =  ( f )
--                  =    f
--
-- 
-- The function "id" is applied to the function "f". The result is the function "f".
-- "id" is used with the type instance "(Int -> Bool) -> (Int -> Bool)".


-- GHCi> (id f) 0
-- False




-- What type does  "f"  have if  "f id"  is properly typed?
-----------------------------------------------------------
--
-- The question for us is, what most general type does "f" need
-- so that "f id" is valid too and doesn't result in a type error.
--
-- (I think the answers will be based on the assumptions a reader
-- makes at this time. I don't know the type inference algorithm yet.
-- At this moment I'm limited to use basic rules, like binding power
-- of function application in contrast to function composition and
-- an investigation of what types the functions have that are in-
-- volved in some expression.)
-- 
-- "f" is applied to "id". That means "f" is a higher order
-- function and expects a function argument. But this is not all.
-- My answer to this question is: it depends. Because the type of "f"
-- does not only depend on its argument where it is used. its important
-- how "f" uses its argument(s) too. This is why we have to examine the
-- definition of "f" as well and look out for argument bindings if we want
-- to infer the type correctly. We have several possibilities:
--
--
-- Case 1: "f" doesn't use its argument (the id function isn't applied to anything).
--
-- The type of "f" is "a -> b".
--
--
-- Case 2: "f" uses its argument (the id function is applied to something).
--
-- The type of "f" is "(a -> b) -> b".
--
--
-- Case 3: "f" uses its argument and the argument type is restricted.
--
-- The type of "f" is "(a -> a) -> b".
--
--
-- Case 4: "f" uses its argument and the argument and the result types are restricted.
--
-- The type of "f" is "(a -> a) -> a".
--
--
-- Case 1 and 2 are the most/more general ones.
--
--
-- Question: Did I miss cases? My mind says that partial application of "f"
-- would extend my cases infinitely, but luckily partial application wasn't
-- introduced at this time in the book. Anything else?


-- GHCi experiments:


-- GHCi> f id
--
-- <interactive>:20:3:
--     Couldn't match expected type `Int' with actual type `a0 -> a0'
--     Probable cause: `id' is applied to too few arguments
--     In the first argument of `f', namely `id'
--     In the expression: f id


{- GHCi>

let f :: (a -> a) -> IO () ; f _ = print "f"

f id

-}
-- "f"


{- GHCi>

let f a = undefined
let t = f id

:t f

-}
-- f :: t -> t1


{- GHCi>

let f a = a undefined
let t = f id

:t f

-}
-- f :: (t1 -> t) -> t




-- Question: I'm curious: what is "(id . 1)"? Or in general: "(f . (l :: 'Const'))".
--           I typed it into GHCi (let d = id . 1) which told me that it is a valid
--           definition with an inferred type "d :: Num (a -> c) => a -> c". Why?
--           Could this definition make sense in any situations? Is it even applicable?




