(comment
  (import [collections [deque]])
  (setv dq (deque (range 10) :maxlen 10))
  dq
  (.rotate dq 3)
  dq
  (.rotate dq -4)
  dq
  (.appendleft dq -1)
  dq
  (.extend dq [11 22 33])
  dq
  (.extendleft dq [10 20 30 40])
  dq
  (.pop dq) ;; get remove last element
  dq
  (first dq) ;; pick first element
  dq
  (last dq) ;; pick last element

  (setv l [28 14 "28" 5 "9" "1" 0 6 "23" 19])
  (sorted l)
  (sorted l :key int)
  (sorted l :key str)
  )

