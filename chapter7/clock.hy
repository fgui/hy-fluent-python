;;7-15
(import time)

(defn clock [func]
  (defn clocked [&rest args]
    (setv t0 (time.perf-counter)
          result (func #* args)
          elapsed (- (time.perf-counter) t0)
          name func.--name--
          arg-str (.join ", "
                         (gfor arg args (repr arg)))
          )
    (print (% "[%0.8fs] %s(%s) -> %r" (, elapsed name arg-str result)))
    result
    )clocked)

;;7-16

#@(clock
     (defn snooze [seconds]
       (time.sleep seconds)))

#@(clock
     (defn factorial [n]
       (if (< n 2)
           1
           (* n (factorial (dec n))))
       ))

(* "*" 40)
(defmain []
  (print (* "*" 40)
         "Calling (snooze .123)")
  (snooze .123)
  (print (* "*" 40)
         "Calling (factorial 6)")
  (print "6!=" (factorial 6))
  )

;;hy clock.hy

