module I1 where



import Test.QuickCheck




sum :: [Integer] -> [Integer]
sum []                            = 0
sum (integer : remainingIntegers) = integer + sum remainingIntegers



doubleAll :: [Integer] -> [Integer]
doubleAll []                            = []
doubleAll (integer : remainingIntegers) = 2 * integer : doubleAll remainingIntegers



-- Proposition:
-- ------------
--
--  sum (doubleAll integerList) = 2 * sum integerList
--
--
-- Proof by induction:
-- -------------------
--
--
--  Induction Begin (I.B.):
--  ----------------------
--
--    (Base case.) :<=> integerList := []
--
--    =>   (left) := sum (doubleAll integerList)
--                                                | (Base case.)
--                 = sum (doubleAll [])
--                                                | doubleAll
--                 = sum []
--                                                | sum
--                 = 0
--
--
--        (right) := 2 * sum integerList
--                                         | (Base case.)
--                 = 2 * sum []
--                                         | sum
--                 = 2 * 0
--                                         | (Arithmetic.)
--                 = 0
--
--
--    =>  (left) = (right)
--
--    ✔
--
--
--  Induction Hypothesis (I.H.):
--  ----------------------------
--
--   For an arbitrary, but fixed integer-list, the statement:
--
--     sum (doubleAll integerList) = 2 * sum integerList
--
--   holds.
--
--
--  Induction Step (I.S.):
--  ----------------------
--
--          sum (doubleAll (integer : remainingIntegers)) = 2 * sum (integer : remainingIntegers)
--                                                                                                    | doubleAll
--    =>  sum (2 * integer : doubleAll remainingIntegers) = 2 * sum (integer : remainingIntegers)
--                                                                                                    | sum
--    =>  2 * integer + sum (doubleAll remainingIntegers) = 2 * sum (integer : remainingIntegers)
--                                                                                                    | sum
--    =>  2 * integer + sum (doubleAll remainingIntegers) = 2 * (integer + sum remainingIntegers)
--                                                                                                    | (Arithmetic.)
--    =>  2 * integer + sum (doubleAll remainingIntegers) = 2 * integer + 2 * sum remainingIntegers
--                                                                                                    | (I.H.)
--    =>          2 * integer + 2 * sum remainingIntegers = 2 * integer + 2 * sum remainingIntegers
--
--    ■



prop_SumDoubleAll :: [Integer] -> Bool
prop_SumDoubleAll integerList

 = sum (doubleAll integerList) == 2 * sum integerList
 
-- GHCi> quickCheck prop_SumDoubleAll


