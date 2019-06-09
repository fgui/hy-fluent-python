(defclass StrKeyDict0 [dict]
  (defn --missing-- [self key]
    (when (isinstance key str)
        (raise (KeyError key)))
    (get self (str key)))

  (defn get [self key &optional [default None]]
    (try
      (get self key)
      (except [e KeyError]
        default)))

  (defn --contains-- [self key]
    (or (in key (self.keys))
        (in (str key) (self.keys))))
  )

(comment

  (setv d (StrKeyDict0 [(, "2" "two")
                        (, "4" "four")]))
  (get d "2")
  (get d 4)
  (get d 1)

  (.get d "2")
  (.get d 4)
  (.get d "1" "N/A")

  (in 2 d)
  (in 1 d)
  )
