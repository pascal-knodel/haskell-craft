--
--
--
-----------------
-- Exercise 6.58.
-----------------
--
--
--
module E'6'58 where



import E'6'53
 (
   Suit
 , CardType ( Card )
 )
import E'6'55 ( Player )
import E'6'56 (  TrickType ( Trick )  )
import E'6'57 ( winNT )




-- If a player has laid down a trump, the problem is the same like in ex. 6.57 but the leadSuit becomes trumpSuit.


winT :: Suit -> TrickType -> Player   -- T; Trump
winT trumpSuit (
                 Trick leadPlayer (Card leadValue  leadSuit)
                       player_2   (Card value_2    suit_2  )
                       player_3   (Card value_3    suit_3  )
                       player_4   (Card value_4    suit_4  )
               )

 =  winNT trick
 
 where
 
 trick :: TrickType
 trick =  (
            Trick leadPlayer (  Card leadValue  ( if (anyTrumps) then (trumpSuit) else (leadSuit) ) )
                  player_2   (  Card value_2    suit_2                                              )
                  player_3   (  Card value_3    suit_3                                              )
                  player_4   (  Card value_4    suit_4                                              )
          )
         
 anyTrumps :: Bool
 anyTrumps =      suit_2 == trumpSuit
              ||  suit_3 == trumpSuit
              ||  suit_4 == trumpSuit


-- GHCi> winT Hearts (Trick North (Card Two Hearts) East (Card Three Hearts) South (Card Four Hearts) West (Card Five Hearts))
-- West

-- GHCi> winT Hearts (Trick North (Card Two Hearts) East (Card Three Spades) South (Card Four Spades) West (Card Five Spades))
-- North

-- GHCi> winT Spades (Trick North (Card Two Hearts) East (Card Three Spades) South (Card Four Spades) West (Card Five Spades))
-- West




