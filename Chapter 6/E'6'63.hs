--
--
--
-----------------
-- Exercise 6.63.
-----------------
--
--
--
module E'6'63 where



import E'6'53 ( CardType )
import E'6'56 (  TrickType ( Trick )  )
import E'6'60 (  HandsType ( Hands )  )
import E'6'61 ( checkPlay )




-- "checkPlay :: [TrickType] -> Bool" doesn't make sense
-- (you would check a trick against itself, which is always true).
-- Use "checkPlays :: [HandType] -> [TrickType] -> Bool" instead.
--
-- Note: another possible problem might be, that the number of cards held
--       doesn't match the number of cards in the tricks.


checkPlays :: HandsType -> [TrickType] -> Bool
checkPlays _ [] =  True
checkPlays hands@(
       
	   -- "hands" is an alias for "(Hands ...)"
	   
              Hands leadPlayer leadCards
                    player_2   cards_2
                    player_3   cards_3
                    player_4   cards_4
            )
            (
              trick@(
		  
		  -- "trick" is an alias for "(Trick ...)"
		  
                      Trick leadPlayer' leadCard
                            player_2'   card_2
                            player_3'   card_3
                            player_4'   card_4
                    ) : remainingTricks
            )
  
  |  areDifferentPlayerOrders  = error "Different player order in the two ADT-arguments (they have to be in the same order)."
  |  otherwise                 = (checkPlay hands trick) && (checkPlays remainingHands remainingTricks)

 where
 
 areDifferentPlayerOrders :: Bool
 areDifferentPlayerOrders 
 
  |      leadPlayer /= leadPlayer'
     ||  player_2   /= player_2'
     ||  player_3   /= player_3'
     ||  player_4   /= player_4'    = True
  |  otherwise                      = False
 
 remainingHands :: HandsType
 remainingHands =  Hands leadPlayer (removeCard leadCard leadCards)
                         player_2   (removeCard card_2   cards_2  )
                         player_3   (removeCard card_3   cards_3  )
                         player_4   (removeCard card_4   cards_4  )
                        
 removeCard :: CardType -> [CardType] -> [CardType]
 removeCard card cards =  [ otherCard | otherCard <- cards , otherCard /= card ]


{- GHCi>


-- Valid play:

:{
   let hands :: HandsType ;
       hands = Hands North [ Card Two Hearts   ]
                     South [ Card Two Diamonds ]
                     East  [ Card Two Spades   ]
                     West  [ Card Two Clubs    ]
:}

:{
   let tricks :: [TrickType] ;
       tricks = [ Trick North (Card Two Hearts  )
                        South (Card Two Diamonds)
                        East  (Card Two Spades  )
                        West  (Card Two Clubs   ) ]
:}

checkPlays hands tricks -- True (?)


-}




