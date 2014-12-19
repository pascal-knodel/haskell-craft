--
--
--
------------------
-- Exercise 11.30.
------------------
--
--
--
module E'11'30 where



-- Note: Use/See templates for proofs by extensionality.



-- ---------------
-- 1. Proposition:
-- ---------------
--
--   abs . abs  =  abs
--
--
-- Proof By Extensionality:
-- ------------------------
--
--      abs . abs $ x
--   =  abs (abs x)
--   =: (*)
--
--   1. Case:  x is negative
--
--  (*)
--   =  abs ( abs (-x) )
--   =  abs x
--
--   2. Case:  x is positive
--
--  (*)
--   =  abs x
--
--
-- ■ (1. Proof)



-- ---------------
-- 2. Proposition:
-- ---------------
--
--   signum . signum  =  signum
--
--
-- Proof By Extensionality:
-- ------------------------
--
--      signum . signum $ x
--   =  signum (signum x)
--   =: (*)
--
--   1. Case:  x is negative
--
--   =  signum ( signum (-x) )
--   =  signum (-1)
--
--   2. Case:  x is zero
--
--   =  signum (signum 0)
--   =  signum 0
--
--   3. Case:  x is positive
--
--   =  signum (signum x)
--   =  signum x
--
--
-- ■ (2. Proof)




-- Can you think of any other idempotent functions?
--
-- Yes.
--
--   (1.) Identity functions.
--   (2.) Sorting functions.
--   (3.) "Re" (real part) from complex numbers.
--   ...




