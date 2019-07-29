(import collections)

(setv Card (.namedtuple collections "Card" ["rank" "suit"]))

(defclass FrenchDeck []
  [ranks (+ (lfor n (range 2 11) (str n)) (list "JQKA"))
   suits (.split "spades diamonds clubs hearts")]

  (defn --init-- [self]
    (setv self.cards (lfor suit self.suits
                           rank self.ranks
                           (Card rank suit))))

  (defn --len-- [self]
    (len self.cards))

  (defn --getitem-- [self position]
    (get self.cards position)))

(comment
  ;;11-5

  (import [random [shuffle]])

  (setv l (list (range 10)))
  (shuffle l)
  l

  (setv deck (FrenchDeck))
  (shuffle deck)


  ;; 11-6 monkey patching

  ;; it should be [self key value] if in a real hy file --setitem--
  (defn set-card [deck position card]
    (setv (get deck.cards position) card))


  (setv FrenchDeck.--setitem-- set-card)
  (shuffle deck)
  (cut deck None 5)
  )
