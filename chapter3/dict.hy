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

  ;; dict comprehension
  
  (setv DIAL_CODES [(, 86 "China")
                    (, 91 "India")
                    (, 1 "United States")
                    (, 7 "Russia")])

  (setv country-code (dfor [code country] DIAL_CODES [country code]))
  country-code

  (first (.items country-code))
  (dfor [country code] (.items country-code)
        :if (< code 66)
        [code (.upper country)])


  (setv d1 (dict DIAL_CODES))
  (d1.keys)
  (.keys d1)

  (setv d2 (dict (sorted DIAL_CODES)))
  (d2.keys)

  (setv d3 (dict (sorted DIAL_CODES :key (fn[x] (get x 1)))))
  (d3.keys)

  (assert (= d1 d2 d3))
  )
