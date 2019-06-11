(import collections)

(defclass StrKeyDict [collections.UserDict]
  
  (defn --missing-- [self key]
    (if (isinstance key str)
        (raise (keyError key))
        (get self (str key))))

  (defn --contains-- [self key]
    (in (str key) self.data))

  (defn --setitem-- [str key item]
    (setv (get self.data (str key)) item))
  )
