;;7-9
(defn make-average []

  (setv series [])

  (defn averager [new-value]
    (.append series new-value)
    (-> (sum series)
        (/ (len series))))
  averager)

(comment
  ;; 7-10
  (setv avg (make-average))
  (avg 10)
  (avg 11)
  (avg 12)

  ;;7-11
  avg.--code--.co-varnames
  avg.--code--.co-freevars

  ;;7-12
  avg.--code--.co-freevars
  avg.--closure--
  (. (get avg.--closure-- 0) cell-contents)
  )

;;7-13 / 7-14
(defn make-average []
  (setv count 0
        total 0)

  (defn averager [new-value]
    (nonlocal count total) ;;broken without this line
    (+= count 1)
    (+= total new-value)
    (/ total count))
  averager)

(comment
  (setv avg (broken-make-average))
  (avg 10)
  )
