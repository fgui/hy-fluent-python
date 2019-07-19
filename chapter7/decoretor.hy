;;7-1
(comment

  (defn deco [func]
    (defn inner []
      (print "running inner()"))
    inner)

  (with-decorator deco
    (defn target []
      (print "running target()")))

  (do ;; to evaluate tag macro
    #@(deco
        (defn target2 []
          (print "running target()"))))

  (target)
  (target2)


  ;;7-19

  (defn d1 [f] (fn [] (+ (f) "d1")))
  (defn d2 [f] (fn [] (+ (f) "d2")))
  
  (with-decorator
    d1 d2 (defn f[] "f"))

  (f)

  ;; f = (d1 (d2 (f)))
  
  
  
  )


