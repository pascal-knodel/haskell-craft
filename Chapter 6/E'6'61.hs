--
--
--
-----------------
-- Exercise 6.61.
-----------------
--
--
--
module E'6'61 where



import E'6'53
 (
   Suit
 , CardType ( Card )
 )
import E'6'56 (  TrickType ( Trick )  )
import E'6'60 (  HandsType ( Hands )  )




checkPlay :: HandsType -> TrickType -> Bool
checkPlay (
            Hands _ leadCards
                  _ cards_2
                  _ cards_3
                  _ cards_4
          )
          (
            Trick _ (Card leadValue leadSuit)
                  _ (Card value_2   suit_2  )
                  _ (Card value_3   suit_3  )
                  _ (Card value_4   suit_4  )
          )

 =  possible && legal

 where
 
 possible :: Bool
 possible =      (Card leadValue leadSuit) `elem` leadCards
             &&  (Card value_2   suit_2  ) `elem` cards_2
             &&  (Card value_3   suit_3  ) `elem` cards_3
             &&  (Card value_4   suit_4  ) `elem` cards_4

 legal :: Bool
 legal
  
  |  suit_2 /= leadSuit && (isAvailable leadSuit cards_2)  = False
  |  suit_3 /= leadSuit && (isAvailable leadSuit cards_3)  = False
  |  suit_4 /= leadSuit && (isAvailable leadSuit cards_4)  = False
  |  otherwise                                             = True
 

isAvailable :: Suit -> [CardType] -> Bool
isAvailable suit cards =  suit `elem` [ suit | (Card _ suit) <- cards]



{- GHCi>


-- Possible and legal:


:{
   let hands :: HandsType ;
       hands = Hands East  [Card Two   Hearts]
                     North [Card Three Hearts]
                     South [Card Four  Hearts]
                     West  [Card Five  Hearts]
:}
:{
   let trick  :: TrickType ;
       trick = Trick North (Card Two   Hearts) -- Lead.
                     East  (Card Three Hearts)
                     South (Card Four  Hearts)
                     West  (Card Five  Hearts)
:}

checkPlay hands trick -- = True (?)
   

-- Not possible:


:{
   let hands :: HandsType ;
       hands = Hands North [Card Two   Hearts]
                     East  [Card Three Hearts]
                     South [Card Four  Hearts]
                     West  [Card Five  Spades]
:}
:{
   let trick  :: TrickType ;
       trick = Trick North (Card Two   Hearts) -- Lead.
                     East  (Card Three Hearts)
                     South (Card Four  Hearts)
                     West  (Card Five  Hearts) -- Cheater.
:}

checkPlay hands trick -- = False (?)


-- Not legal:


:{
   let hands :: HandsType ;
       hands = Hands North [Card Ace   Hearts, Card Ten   Hearts]
                     East  [Card Jack  Hearts, Card Two   Hearts]
                     South [Card Queen Hearts, Card Three Hearts]
                     West  [Card King  Hearts, Card Two   Spades]
:}
:{
   let trick  :: TrickType ;
       trick = Trick North (Card Ace   Hearts) -- Lead.
                     East  (Card Two   Hearts)
                     South (Card Three Hearts)
                     West  (Card Two   Spades) -- Cheater.
:}

checkPlay hands trick -- = False (?)


-}




