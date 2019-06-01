(import bisect
        sys)

(setv HAYSTACK [1 4 5 6 8 12 15 20 21 23 23 26 29 30]
      NEEDLES [0 1 2 5 8 10 22 23 29 30 31]
      ROW_FMT "{0:2d} @ {1:2d}    {2}{0:<2d}")

(defn demo [bisect-fn]
  (for [needle (reversed NEEDLES)]
    (setv position (bisect-fn HAYSTACK needle)
          offset (* position "  |"))
    (print (.format ROW_FMT needle position offset))
    ))

(defmain [&rest args]
  (setv bisect-fn
       (if (= "left" (get args -1))
           bisect.bisect-left
           bisect.bisect))
  (print "DEMO" bisect-fn.--name--)
  (print "haystack ->" (.join " " (lfor n HAYSTACK (% "%2d" n)) ))
  (demo bisect-fn)
  )

;; run
;; hy order.hy
;; hy order.hy left

(comment
  ;; insort
  
  (import random)
  (setv SIZE 7)
  (random.seed 1729)
  (.seed random 1729) ;;same as above
  (setv my-list [])

  (for [i (range SIZE)]
    (setv new-item (random.randrange (* 2 SIZE)))
    (bisect.insort my-list new-item)
    (print (% "%2d ->" new-item) my-list))
  )
