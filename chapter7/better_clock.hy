;; 7-17 improved clock decorator
(import time)
(import functools)

(defn clock [func]
  #@((functools.wraps func)
      (defn clocked [&rest args &kwargs kwargs]
        (setv t0 (time.time)
              results (func #* args #** kwargs)
              elapsed (- (time.time) t0)
              name func.--name--
              arg-lst [])
        (when args
          (.append arg-lst (.join ", "
                                  (gfor arg args (repr arg)))))
        (when kwargs
          (setv pairs (lfor [k w] (sorted (kwargs.items))
                            (% "%s=%r" (, k w))))
          (.append arg-lst (.join ", " pairs)))
        (setv arg-str (.join ", " arg-lst))
        (print (% "[%0.8fs] %s(%s) -> %r" (, elapsed name arg-str results)))
        results))
  clocked)

;;7-18
#@(clock
    (defn fibonacci [n]
      (if (< n 2)
          n
          (+
            (fibonacci (dec (dec n)))
            (fibonacci (dec n)))))
    )

;;7-19
#@(clock
    (functools.lru-cache)
    (defn fibonacci-m [n]
      (if (< n 2)
          n
          (+
            (fibonacci-m (dec (dec n)))
            (fibonacci-m (dec n)))))
    )

(defmain []
  (print(fibonacci 6))
  (print(fibonacci-m 6)))
