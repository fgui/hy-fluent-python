(comment

  (setv lax-coordinates
        (, 33.9425 118.408056))
  (setv [city year pop chg area]
        (, "Tokyo" 2003 32450 0.66 8014))
  (setv traveler-ids
        [(, "USA" "31195855")
         (, "BRA" "CE342567")
         (, "ESP" "XDA205856")])

  (for [passport (sorted traveler-ids)]
    (print (% "%s/%s" passport)))
  (for [[country _] (sorted traveler-ids)]
    (print country))

  ;;unpacking
  (setv [latitude longitude]
        lax-coordinates)
  latitude
  longitude

  (setv a 1
        b 2)
  (setv [a b] (, b a))


  (divmod 20 8)
  (setv t (, 20 8))

  (setv [quotient reminder]
        (divmod #* t))
  (, quotient reminder)

  (import os)
  (setv [_ filename]
    (os.path.split "/usr/bin/cal"))
  filename

  ;; rest is a function in hy, used word extra instead.
  (setv [a b #* extra] (range 5))
  (, a b extra)
  (setv [a b #* extra] (range 3))
  (, a b extra)
  (setv [a b #* extra] (range 2))
  (, a b extra)

  (setv [a #* body c d] (range 5))
  (, a body c d)
  (setv [#* head b c d] (range 5))
  (, head b c d)
  ;;note: there is no need for space after #*
  (setv [#*head b c d] (range 5))
  (, head b c d)
)

(setv
  metro-areas
  [
    (, "Tokyo" "JP" 36.933 (, 35.689722 139.691667))
    (, "Delhi NCR" "IN" 21.935 (, 28.613889 77.208889))
    (, "Mexico City" "MX" 20.142 (, 19.433333 -99.133333))
    (, "New York-Newark" "US" 20.104 (, 40.808611 -74.020386))
    (, "Sao Paulo" "BR" 19.649 (, -23.547778 -46.635833))]
  )

(comment
  (print (.format "{:15} | {:^9} | {:^9}" "" "lat" "long"))
  

  (setv fmt "{:15} | {:9.4f} | {:9.4f}")

  (for [[name cc pop [latitude longitude]] metro-areas]
    (if (<= longitude 0)
        (print (.format fmt  name latitude longitude))))
  )

(comment
  ;; named tuples

  (import [collections [namedtuple]])
  (setv City (namedtuple "City" "name country population coordinates"))
  (setv tokyo (City "Tokyo" "JP" 36.933 (, 35.689722 139.691667)))
  tokyo
  tokyo.population
  tokyo.coordinates
  (get tokyo 1)

  City.-fields
  (setv LatLong (namedtuple "LatLong" "lat long"))
  (setv delhi-data
        (, "Delhi NCR" "IN" 21.935
           (LatLong 28.613998 77.208889)))
  (setv delhi (City.-make delhi-data))
  (delhi.-asdict)

  (for [[key value] (.items (delhi.-asdict))]
    (print (+ key ":") value)) 
  )
