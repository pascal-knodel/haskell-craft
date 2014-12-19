module E14 where



type MyType = Integer

definition :: MyType
definition = definitionOne * definitionTwo

             where 
             
             definitionOne :: MyType
             definitionTwo :. MyType   -- German keyboard.
             
             definitionOne = 1
             definitionTwo = 1



{-

type MyType = Integer

definition :: MyType
definition = definitionOne * definitionTwo

             where 
             
             definitionOne :: MyType
             definitionTwo :: MyType
             
             definitionOne = 1
             definitionTwo = 1
              
-}