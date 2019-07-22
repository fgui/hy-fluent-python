(import time)

(setv DEFAULT-FMT "[{elapsed:0.8f}s] {name}({args}) -> {result}")

(defn clock [&optional [fmt DEFAULT-FMT]]
  (defn decorate [func]
    (defn clocked [&rest -args]
      (setv t0 (time.perf-counter)
            -result (func #* -args)
            elapsed (- (time.perf-counter) t0)
            name func.--name--
            result (repr -result)
            args (.join ", "
                           (gfor arg -args (repr arg)))
            )
      (print (.format fmt #** (locals)))
      result)
    clocked)
  decorate)

(defmain []
  #@((clock)
      (defn snooze [seconds]
        (.sleep time seconds)))

  (for [i (range 3)]
    (snooze .123))


  ;;7-26
  #@((clock "{name}: {elapsed}s")
      (defn snooze2 [seconds]
        (.sleep time seconds)))

  (for [i (range 3)]
    (snooze2 .123))


  ;;7-27
  #@((clock "{name}({args}) dt={elapsed:0.3f}s")
      (defn snooze3 [seconds]
        (.sleep time seconds)))

  (for [i (range 3)]
    (snooze3 .123))

  )
