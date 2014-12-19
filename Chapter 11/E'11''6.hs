--
--
--
-----------------
-- Exercise 11.6.
-----------------
--
--
--
module E'11''6 where



import Prelude hiding ( id )




id :: a -> a
id x =  x


f :: Int -> Bool   -- Example "f":
f 0 =  False
f 1 =  True
f _ =  undefined



-- Behaviour and type instance of  "(id $ f)"  :
------------------------------------------------
--
-- "(id $ f)" means 'apply "id" to "f"'. 
--
--
-- Proposition:   (id $ f)  =  f
--
--       Proof:    (id $ f)
--                            | $
--              =  (id f)
--              =  id f
--                            | id
--              =  f
--
-- "id" is used with the most general type instance "(Int -> Bool) -> (Int -> Bool)",
-- since the application of ($) simplifies to normal function application.



-- Behaviour and type instance of  "(f $ id)"  :
------------------------------------------------
--
-- Proposition:   (f $ id) will result in a compiler error.
--
--       Proof:      (f $ id)
--                              | $
--                =  (f id)
--                =  f id       | ☠ ; contradiction
--                              | "f" declares integer input, but
--                              | "id" declares something polymorphic.
--
-- There is no instance at all.


{- GHCi>

f id

-}
--
-- <interactive>:2:3:
--     Couldn't match expected type `Int' with actual type `a0 -> a0'
--     Probable cause: `id' is applied to too few arguments
--     In the first argument of `f', namely `id'
--     In the expression: f id



-- Behaviour and type instance of  "id ($)"  :
----------------------------------------------
--
-- It is just the function application.
--
-- Proposition:   id ($)  =  ($)
--
--       Proof:      id ($)
--                            | id
--                =  ($)
--
-- The instance is polymorphic as well:
-- "((a -> b) -> a -> b) -> ((a -> b) -> a -> b)".


{- GHCi>

:t (id ($))

-}
-- (id ($)) :: (a -> b) -> a -> b



-- What type does "f" have if "f $ id" is properly typed?
---------------------------------------------------------
--
-- The type of "f" is "(a -> b) -> b".
--
-- Note: With my current knowledge about the type system
--       I would argument the same way I did in exercise 11.2 .




