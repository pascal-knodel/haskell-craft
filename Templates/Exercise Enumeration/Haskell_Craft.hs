--
-- Chapter/Exercise template creation.
--
module Haskell_Craft where



import Prelude hiding ( writeFile )

import System.IO.UTF8   -- cabal install utf8-string




ct :: Integer -> Integer -> String   -- ct; chapter template.
ct chapter exercises

 =    "--\n"
   ++ "-- Chapter " ++ chapterString ++ ".\n"
   ++ "--\n"
   ++ "module C'" ++ chapterString ++ " where\n"
   ++ [ '\n' | _ <- [ 1 .. 3 ] ]
   ++ imports chapter exercises
 
 where
 
 chapterString :: String
 chapterString = show chapter
 
 imports :: Integer -> Integer -> String
 imports chapter 1 = "import " ++ ( makeModuleName chapter 1 exercises )
 imports chapter exercise
 
  =    "import " ++ ( makeModuleName chapter exercise exercises ) ++ "\n"
    ++ imports chapter ( exercise - 1 )



wct :: Integer -> Integer -> IO ()   -- Write chapter file.
wct chapter exercises

 = do writeFile ("C'" ++ ( show chapter ) ++ ".hs") ( ct chapter exercises )




et :: Integer -> Integer -> Integer -> String   -- et; exercise template.
et chapter exercise exercises

 =    "--\n"
   ++ "--\n"
   ++ "--\n"
   ++ "--" ++ dashedLine ++ "\n"
   ++ "--" ++ exerciseID ++ "\n"
   ++ "--" ++ dashedLine ++ "\n"
   ++ "--\n"
   ++ "--\n"
   ++ "--\n"
   ++ "module " ++ ( makeModuleName chapter exercise exercises ) ++ " where\n"
   ++ [ '\n' | _ <- [ 1 .. 10 ] ]

 where
 
 exerciseID :: String
 exerciseID = makeExerciseID chapter exercise
 
 dashedLine :: String
 dashedLine = [ '-' | _ <- [ 1 .. length exerciseID ] ] 



makeExerciseID :: Integer -> Integer -> String
makeExerciseID chapter exercise

 = " Exercise " ++ chapterString ++ "." ++ exerciseString ++ "."
 
 where
 
 chapterString :: String
 chapterString = show chapter
 
 exerciseString :: String
 exerciseString = show exercise



makeModuleName :: Integer -> Integer -> Integer -> String
makeModuleName chapter exercise exercises

 = "E'" ++ chapterString ++ [ '\'' | _ <- [ 1 .. separators ] ] ++ exerciseString
 
 where
 
 chapterString :: String
 chapterString = show chapter
 
 exerciseString :: String
 exerciseString = show exercise
  
 exercisesString :: String
 exercisesString = show exercises
 
 separators :: Int
 separators = length exercisesString - length exerciseString + 1



wet :: Integer -> Integer -> Integer -> IO ()   -- Write exercise template.
wet chapter exercise exercises

 = do writeFile ( makeModuleName chapter exercise exercises ++ ".hs") exerciseTemplate
 
 where
 
 exerciseTemplate :: String
 exerciseTemplate = et chapter exercise exercises



wets :: Integer -> Integer -> Integer -> IO ()   -- Write exercise templates.
wets chapter 1 exercises = do wet chapter 1 exercises
wets chapter exercise exercises

 = do wet chapter exercise exercises
      wets chapter ( exercise - 1 ) exercises



-- 3.1 - 3.27
-- 4.1 - 4.39
-- 5.1 - 5.34
-- 6.1 - 6.63
-- 7.1 - 7.35
-- 8.1 - 8.22
-- 9.1 - 9.15
-- 10.1 - 10.37
-- 11.1 - 11.36
-- 12.1 - 12.45
-- 13.1 - 13.28
-- 14.1 - 14.47
-- 15.1 - 15.18
-- 16.1 - 16.50
-- 17.1 - 17.36
-- 18.1 - 18.29
-- 19.1 - 19.14
-- 20.1 - 20.27


{- GHCi>

wct 3 27
wets 3 27 27

-}




