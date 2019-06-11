(comment

  (import [types [MappingProxyType]])
  (setv d {1 "A"}
        d-proxy (MappingProxyType d))
  d-proxy
  (get d-proxy 1)
  (setv (get d-proxy 2) "x")
  ;;error

  (setv (get d 2) "B")
  d-proxy
  (get d-proxy 2)

  ;;MappingProxyType is an immutable view on a Map. The view cannot be muttated
  ;; muttations on the original map are viewable from the proxy.

  )
