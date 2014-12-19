module E28 where




function :: a -> a
function =  undefined

functionList :: [a -> a]
functionList =  [ function .. ]



-- Possible correction:
{-

type Unary = a -> a


function :: Unary
function =  undefined

functionList :: [Unary]
functionList =  [ function | _ <- [1 ..] ]

-}




