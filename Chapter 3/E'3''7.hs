--
--
--
----------------
-- Exercise 3.7.
----------------
--
--
--
module E'3''7 where



import E'3''2 ( xor2 )
import E'3''3 ( xor3 )
import E'3''4 ( (&&) , (||) )
import E'3''5 ( nAnd , nAnd2 )

import Prelude hiding ( not , (&&) , (||) )
import qualified Prelude ( not , (&&) , (||) )

import Test.QuickCheck ( quickCheck )




-- From subchapter 3.1, Literals and definitions (examples).


not :: Bool -> Bool
not True = False
not False = True

xor :: Bool -> Bool -> Bool
xor True a = not a
xor False a = a


-- ...



-- "not"-example:


prop_not :: Bool -> Bool
prop_not a

 =  Prelude.not a == not a

-- GHCi> quickCheck prop_not



-- "xor"-example:


prop_xor :: Bool -> Bool -> Bool
prop_xor a b

 =  a `xor` b == ( a /= b )

-- GHCi> quickCheck prop_xor



-- Ex. 3.2:


prop_xor2 :: Bool -> Bool -> Bool
prop_xor2 a b

 =  a `xor2` b == ( a /= b )

-- GHCi> quickCheck prop_xor2



-- Ex. 3.3:


prop_xor3 :: Bool -> Bool -> Bool
prop_xor3 a b

 =  a `xor3` b == ( a /= b )   -- "==" and "/=" are non-associative.

-- GHCi> quickCheck prop_xor3



-- Ex. 3.2, 3.3:


prop_xor2xor3 :: Bool -> Bool -> Bool
prop_xor2xor3 a b

 =  a `xor2` b == a `xor3` b

-- GHCi> quickCheck prop_xor2xor3



-- Ex. 3.4:


prop_and :: Bool -> Bool -> Bool
prop_and a b

 =  ( a Prelude.&& b ) == ( a && b )   -- "==" has higher precedence than "&&".

-- GHCi> quickCheck prop_and


prop_or :: Bool -> Bool -> Bool
prop_or a b

 =  ( a Prelude.|| b ) == ( a || b )   -- "==" has higher precedence than "||".

-- GHCi> quickCheck prop_or



-- Ex. 3.5:


prop_nAnd :: Bool -> Bool -> Bool
prop_nAnd a b

 =  not ( a Prelude.&& b ) == a `nAnd` b

-- GHCi> quickCheck prop_nAnd



prop_nAnd2 :: Bool -> Bool -> Bool
prop_nAnd2 a b

 =  not ( a Prelude.&& b ) == a `nAnd2` b

-- GHCi> quickCheck prop_nAnd2



-- ...




{- GHCi>

quickCheck prop_not
quickCheck prop_xor
quickCheck prop_xor2
quickCheck prop_xor3
quickCheck prop_xor2xor3
quickCheck prop_and
quickCheck prop_or
quickCheck prop_nAnd
quickCheck prop_nAnd2

-}




