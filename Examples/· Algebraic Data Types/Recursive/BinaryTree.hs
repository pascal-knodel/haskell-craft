-- Binary tree.
module BinaryTree where




data Tree t

 =     Leaf
    |  Fork (Tree t) t (Tree t)
	


forks :: Tree t -> Integer
forks Leaf =  0
forks (Fork left _ right) =  (forks left) + 1 + (forks right)

{- GHCi>


type Label =  String

:{

let tree :: Tree Label
    tree =  Fork Leaf "root" Leaf

:}

forks tree


-}
-- 1



height :: Tree t -> Integer
height Leaf =  0
height (Fork left _ right) =  1 + max (height left) (height right)


{- GHCi>


type Label =  String

:{

let tree :: Tree Label
    tree =  Fork (Fork Leaf "fork" Leaf) "root" Leaf

:}

height tree


-}
-- 2




