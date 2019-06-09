(comment

  (setv tt (, 1 2 (, 30 40)))
  (hash tt)

  (setv tf (, 1 2 (frozenset [30 40])))
  (hash tf)

  (setv a (dict :one 1 :two 2 :three 3))
  (setv b {"one" 1 "two" 2 "three" 3})
  (setv c (dict (zip ["one" "two" "three"]
                     [1 2 3])))
  (setv d (dict [(, "two" 2)
                 (, "one" 1)
                 (, "three" 3)]))
  (setv e (dict {"three" 3
                 "one" 1
                 "two" 2}))
  (= a b c d e)

  )
