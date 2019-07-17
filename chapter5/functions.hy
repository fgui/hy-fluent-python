(comment
  ;;5-1
  (defn factorial [n]
    "returns n!"
    (if (< n 2) 1 (* n (factorial (- n 1)))))

  (factorial 42)
  (type factorial)
  factorial.--doc--

  ;; first class functions
  ;;5-2
  (setv fact factorial)
  fact
  (fact 5)
  (list (map factorial (range 11)))

  ;; higher order functions - functions that return functions or return functions
  ;; 5-3
  (setv fruits ["strawberry" "fig" "apple" "cherry" "raspberry" "banana"])
  (sorted fruits :key len)

  ;;5-4
  (defn reverse [word]
    (cut word None None -1))
  (reverse "testing")
  (sorted fruits :key reverse)

  ;;5-5
  (list (map fact (range 6)))
  (lfor n (range 6) (fact n))
  (list (map factorial (filter (fn [x] (% x 2)) (range 6))))
  (lfor n (range 6)
        :if (% n 2)
        (fact n))

  ;;5-6
  (reduce + (range 100))


  (dir factorial)

  (defn upper-case-name [obj]
    (.upper (% "%s %s" (, obj.first-name obj.last-name))))

  (setv upper-case-name.short-description "Customer name")

  (dir upper-case-name)

  ;; 5-9
  (defclass C []) ;;bare class
  (setv obj (C)) ;;bare instance
  (defn func []) ;;bare function
  (sorted (- (set (dir func)) (set (dir obj)))) ;;attribute in func not in class.


  ;;5-21 / 5-22
  (defn fact [n] (reduce * (range 1 (inc n))))

  ;;5-23
  (setv
    metro-data
    [(, "Tokyo" "JP" 36.933 (, 35.689722 139.691667))
     (, "Delhi NCR" "IN" 21.935 (, 28.613889 77.208889))
     (, "Mexico City" "MX" 20.142 (, 19.433333 -99.133333))
     (, "New York-Newark" "US" 20.104 (, 40.808611 -74.020386))
     (, "Sao Paulo" "BR" 19.649 (, -23.547778 -46.635833))])

  (for [city (sorted metro-data :key (fn [x] (get x 1)))]
    (print city))

  (import [operator [itemgetter]])
  (for [city (sorted metro-data :key (itemgetter 1))]
    (print city))

  (setv cc-name (itemgetter 1 0))
  (for [city metro-data] (print (cc-name city)))
  )
