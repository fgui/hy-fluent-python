;;7-1 import time vs runtime
;; hy registration.hy

(setv registry [])

(defn register [func]
  (print (% "running register(%s)" func))
  (.append registry func)
  func)

#@(register (defn f1 [] (print "running (f1)")))
#@(register (defn f2 [] (print "running (f2)")))
(defn f3 [] (print "running (f3)"))

(defmain []
  (print "running (main)")
  (print "registry ->" registry)
  (f1)
  (f2)
  (f3))

(comment
  (import registration)
  )
