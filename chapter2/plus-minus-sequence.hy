(comment

  (setv l [1 2 3])
  (* 5 l)
  (* l 5)
  (* 5 "abcd")

  (setv board (lfor i (range 3) (* 3 ["_"])))
  board
  (setv (get board 1 2) "X")
  board

  (setv weird-board (* 3 [(* 3 ["_"])]))
  weird-board
  (setv (get weird-board 1 2) "O")
  weird-board


  ;; augmented assignment

  ;; list mutable
  (setv l [1 2 3])
  (id l)
  (*= l 2)
  l
  (id l)
  (+= l [3])
  l
  (id l)

  ;; tuple immutable
  (setv t (, 1 2 3))
  (id t)
  (*= t 2)
  (id t)

  ;; assigmen puzzle
  (setv t (, 1 2 [30 40]))
  (id t)
  (+= (get t 2) [50 60])
  t
  (id t)
  
  )
