(import builtins)
(import collections)
(import [collections [ChainMap]])

(setv pylookup (ChainMap (locals) (globals) (vars builtins)))

(setv ct (collections.Counter "abracadabra"))
ct
(.update ct "aaaaazzz")
ct
(.most-common ct 2)

(defclass StrKeyDict [collections.UserDict]
  (defn --missing-- [self key]
    (when (isinstance key str)
      ))
  )
