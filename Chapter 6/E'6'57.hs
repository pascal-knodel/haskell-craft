--
--
--
-----------------
-- Exercise 6.57.
-----------------
--
--
--
module E'6'57 where



import E'6'53
 (
   CardValue
 , CardType ( Card )
 )
import E'6'55 ( Player )
import E'6'56 (  TrickType ( Trick )  )




winNT :: TrickType -> Player   -- NT; No Trump.
winNT (
        Trick leadPlayer (Card leadValue  leadSuit)
              player_2   (Card value_2    suit_2  )
              player_3   (Card value_3    suit_3  )
              player_4   (Card value_4    suit_4  )
      )

 =  winner
 
 where
 
 winner :: Player
 winner
  
  |  leadSuit == suit_2 && highestCard == value_2  = player_2
  |  leadSuit == suit_3 && highestCard == value_3  = player_3
  |  leadSuit == suit_4 && highestCard == value_4  = player_4
  |  otherwise                                     = leadPlayer
  
 highestCard :: CardValue
 highestCard =         leadValue 
                `max`  value_2
                `max`  value_3
                `max`  value_4


{- GHCi>

winNT (Trick North (Card Two Hearts) East (Card Three Hearts) South (Card Four Hearts) West (Card Five Hearts))
winNT (Trick North (Card Two Hearts) East (Card Three Spades) South (Card Four Spades) West (Card Five Spades))

-}
-- West
-- North




