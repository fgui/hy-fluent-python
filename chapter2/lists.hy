(comment

  (setv symbols "$¢£¥€¤")
  (setv codes [])
  (for [symbol symbols]
    (.append codes (ord symbol)))
  codes

  ;; list comprehesion
  (setv codes (lfor symbol symbols (ord symbol)))
  codes

  (setv beyond-ascii
        (lfor s symbols
              :if (> (ord s) 127)
              (ord s)))

  beyond-ascii

  (setv beyond-ascii
        (->> symbols
             (map ord)
             (filter (fn [x] (> x 127)))
             (list)))
  beyond-ascii

  ;; cartesian products

  (setv colors ["black" "white"]
        sizes ["S" "M" "L"]
        tshirts (lfor color colors
                      size sizes
                      (, color size)))
  tshirts

  (for [color colors]
    (for [size sizes]
      (print (, color size))))

  ;; by size instead of color
  (setv tshirts  (lfor size sizes
                       color colors
                       (, color size)))

  ;; generator experssion
  ;; in hy use
  (tuple (gfor symbol symbols (ord symbol)))

  (import array)
  (array.array "I" (gfor symbol symbols (ord symbol)))

  (for [tshirt (gfor c colors
                     s sizes
                     (% "%s %s" (, c s)))]
    (print tshirt))
)
