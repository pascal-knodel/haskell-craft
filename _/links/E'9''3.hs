--
--
--
----------------
-- Exercise 9.3.
----------------
--
--
--
module E'9''3 where



-- Note: Use/See templates for structural induction.



import Prelude hiding ( map ) 




-- Note: "picture" could be a list of strings. In any case it's a list of lists 
--       (if you haven't read the book, you must spot this now). Further it's
--       important to take a look at (/ think of) the primitive recursive "map" function ...



map :: -- See hidden imports.
          ( function_argument_type -> function_result_type ) -- The function. 
       -> [ function_argument_type ] -- List with inputs for the function.
       -> [ function_result_type   ] -- List with outputs from the function.
       
map function [] = []
map function (listItem : remainingListItems)

 = function listItem : map function remainingListItems



-- Note: Re/-member/-think/-view the definitions of "reverse" and "++".



-- ------------
-- Proposition:
-- ------------
--
--                 flipV (flipH picture) = flipH (flipV picture)
--                                                                         | flipV, flipH
--    <=>  map reverse (reverse picture) = reverse (map reverse picture)
--
--
-- Proof By Structural Induction:
-- ------------------------------
--
--
--   Induction Beginning (I.B.):
--   ---------------------------
--
--     (Base case 1.)  :<=>  picture := []
--     
--
--       =>  (left) := flipV (flipH picture)
--                                                     | flipV
--                   = map reverse (reverse picture)
--                                                     | (Base case 1.)
--                   = map reverse (reverse [])
--                                                     | reverse
--                   = map reverse []
--                                                     | map
--                   = []
--
--
--          (right) := flipH (flipV picture)
--                                                     | map
--                   = reverse (map reverse picture)
--                                                     | (Base case 1.)
--                   = reverse (map reverse [])
--                                                     | map
--                   = reverse []
--                                                     | reverse
--                   = []
--
--
--       => (left) = (right)
--
--       ✔
--
--
--  Induction Hypothesis (I.H.):
--  ----------------------------
--
--    For an arbitrary, but fixed list "picture", the statement ...
--
--                   flipV (flipH picture) = flipH (flipV picture)
--      <=>  map reverse (reverse picture) = reverse (map reverse picture)
--
--    ... holds.
--
--
--  Induction Step (I.S.):
--  ----------------------
--
-- 
--     (left) := flipV (flipH (pictureLine : picture))
--                                                                        | flipV, flipH
--             = map reverse (reverse (pictureLine : picture))
--                                                                        | reverse
--             = map reverse (reverse picture ++ [pictureLine])
--                                                                        | (Property of map, not yet proven)
--             = map reverse (reverse picture) ++ [reverse pictureLine]
--                                                                        | (I.H.)
--             = reverse (map reverse picture) ++ [reverse pictureLine]
--                                                                        | reverse
--             = reverse (reverse pictureLine : map reverse picture)
--                                                                        | map
--             = reverse (map reverse (pictureLine : picture))
--
--
--    (right) := flipH (flipV picture)
--                                                                        | flipV, flipH
--             = reverse (map reverse (pictureLine : picture))
--
--
--    =>  (left) = (right)
--
--    ■
--
--
-- Alternately:
--
--
--    (right) := flipH (flipV picture)
--                                                                        | flipV, flipH
--             = reverse (map reverse (pictureLine : picture))
--                                                                        | map
--             = reverse (reverse pictureLine : map reverse picture)
--                                                                        | reverse
--             = reverse (map reverse picture) ++ [reverse pictureLine]
--                                                                        | (I.H.)
--             = map reverse (reverse picture) ++ [reverse pictureLine]
--                                                                        | (Property of map, not yet proven.)
--             = map reverse (reverse picture ++ [pictureLine])
--                                                                        | reverse
--             = map reverse (reverse (pictureLine : picture))
--
--             = (left)
--
--
--     (left) := flipV (flipH (pictureLine : picture))
--                                                                        | flipV, flipH
--             = map reverse (reverse (pictureLine : picture))
--
--
--    =>  (left) = (right)
--
--    ■




-- ------------
-- Proposition:
-- ------------
--
--                     flipV (flipV picture) = picture
--    <=>  map reverse (map reverse picture) = picture
--
--
-- Proof By Structural Induction:
-- ------------------------------
--
--
--   Induction Beginning (I.B.):
--   ---------------------------
--
--     (Base case 1.)  :<=>  picture := []
--     
--
--       =>  (left) := flipV (flipV picture)
--                                                         | flipV
--                   = map reverse (map reverse picture)
--                                                         | (Base case 1.)
--                   = map reverse (map reverse [])       
--                                                         | map
--                   = map reverse (reverse [])           
--                                                         | reverse
--                   = map reverse []                     
--                                                         | map
--                   = reverse []                
--                                                         | reverse
--                   = []
--
--
--          (right) := picture
--                              | (Base case 1.)
--                   = []
--
--
--       => (left) = (right)
--
--       ✔
--
--
--  Induction Hypothesis (I.H.):
--  ----------------------------
--
--    For an arbitrary, but fixed list "picture", the statement ...
--
--                       flipV (flipV picture) = picture
--      <=>  map reverse (map reverse picture) = picture
--
--    ... holds.
--
--
--  Induction Step (I.S.):
--  ----------------------
--
-- 
--     (left) := flipV (flipV picture) = picture
--                                                                         | flipV
--             = map reverse (map reverse (pictureLine : picture))
--                                                                         | map
--             = map reverse (reverse pictureLine : map reverse picture)
--                                                                         | reverse [singleItem] = ... = [singleItem]
--             = map reverse (pictureLine : map reverse picture)
--                                                                         | map
--             = reverse pictureLine : map reverse (map reverse picture)
--                                                                         | reverse [singleItem] = ... = [singleItem]
--             = pictureLine : map reverse (map reverse picture)
--                                                                         | (I.H.)
--             = pictureLine : picture
--
--
--    (right) := pictureLine : picture
--
--
--    =>  (left) = (right)
--
--    ■



-- ------------
-- Proposition:
-- ------------
--
--            flipH (flipH picture) = picture
--    <=> reverse (reverse picture) = picture
--
--
-- Proof By Structural Induction:
-- ------------------------------
--
--
--   Induction Beginning (I.B.):
--   ---------------------------
--
--     (Base case 1.)  :<=>  picture := []
--     
--
--       =>  (left) := flipH (flipH picture)
--                                                 | flipH
--                   = reverse (reverse picture)
--                                                 | (Base case 1.)
--                   = reverse (reverse [])
--                                                 | reverse
--                   = reverse []
--                                                 | reverse
--                   = []
--
--
--          (right) := picture
--                               | (Base case 1.)
--                   = []
--
--
--       => (left) = (right)
--
--       ✔
--
--
--  Induction Hypothesis (I.H.):
--  ----------------------------
--
--    For an arbitrary, but fixed list "picture", the statement ...
--
--              flipH (flipH picture) = picture
--      <=> reverse (reverse picture) = picture
--
--    ... holds.
--
--
--  Induction Step (I.S.):
--  ----------------------
--
-- 
--     (left) := flipH (flipH (pictureLine : picture))
--                                                                    | flipH
--             = reverse (reverse (pictureLine : picture))
--                                                                    | reverse
--             = reverse (reverse picture ++ [pictureLine])
--                                                                    | (Example 9.6.2 from the book, see *[1] below.)
--             = reverse [pictureLine] ++ reverse (reverse picture)
--                                                                    | reverse [singleItem] = ... = [singleItem]
--             = [pictureLine] ++ reverse (reverse picture)
--                                                                    | I.H.
--             = [pictureLine] ++ picture
--             = (pictureLine : []) ++ picture
--                                                                    | ++
--             = pictureLine : ([] ++ picture)
--                                                                    | ++
--             = pictureLine : picture
--
--
--    (right) := pictureLine : picture
--
--
--    =>  (left) = (right)
--
--    ■



-- Note: If the naming with "picture" and "pictureLine" is distracting,
--       just think of lists (of lists).
--
-- *[1] reverse (list_1 ++ list_2) = reverse list_2 ++ reverse list_1




