--
--
--
-----------------
-- Exercise 6.62.
-----------------
--
--
--
module E'6'62 where



import E'6'53 ( Suit )
import E'6'55
 (
   Player ( North , South )
 )
import E'6'56 (  TrickType ( Trick )  )
import E'6'57 ( winNT )
import E'6'58 ( winT )




data Team =     NorthSouth
             |  EastWest
             deriving ( Read , Show )


winnerNT :: [TrickType] -> Team   -- NT; No Trump
winnerNT tricks

 |  length tricks > 13  = error "Thirteen tricks exceeded."
 |  winsNS < winsEW     = EastWest
 |  otherwise           = NorthSouth
 
 where
 
 wins :: [Player]
 wins =  [ winNT trick | trick <- tricks ]
 
 winsNS, winsEW :: Int -- NS; North or South, EW; East or West
 winsNS =  teamWins North South wins
 winsEW =  13 - winsNS


winnerT :: Suit -> [TrickType] -> Team -- T; Trump
winnerT trumpSuit tricks

 |  length tricks > 13  = error "Thirteen tricks exceeded."
 |  winsNS < winsEW     = EastWest
 |  otherwise           = NorthSouth

 where
 
 wins :: [Player]
 wins =  [ winT trumpSuit trick | trick <- tricks ]
 
 winsNS, winsEW :: Int -- NS; North or South, EW; East or West
 winsNS =  teamWins North South wins
 winsEW =  13 - winsNS


teamWins :: Player -> Player -> [Player] -> Int
teamWins _        _        [] = 0
teamWins player_1 player_2 (trickWinner : remainingTrickWinners)
 
 |      player_1 == trickWinner
    ||  player_2 == trickWinner  = 1 + teamWins player_1 player_2 remainingTrickWinners
 |  otherwise                    =     teamWins player_1 player_2 remainingTrickWinners

 
{- GHCi>


:{
   let northSouthWin :: TrickType ;
       northSouthWin = Trick North (Card Two Hearts) South (Card Two Diamonds)
                             East  (Card Two Spades) West  (Card Two Clubs   ) -- Just for example.
:}

:{
   let tricks :: [TrickType] ;
       tricks = [ northSouthWin | _ <- [ 1 .. 13 ] ]
:}

winnerNT        tricks
winnerT  Spades tricks


-}



