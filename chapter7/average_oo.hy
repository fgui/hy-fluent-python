;; 7-8
(defclass Average []

  (defn --init-- [self]
    (setv self.series []))
  (defn --call-- [self new-value]
    (.append self.series new-value)
    (setv total (sum self.series))
    (/ total (len self.series))))

(comment
  (setv avg (Average))
  (avg 10)
  (avg 11)
  (avg 12)
  )
