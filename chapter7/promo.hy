;; 7-3

(setv promos [])

(defn promotion [promo-func]
  (.append promos promo-func)
  promo-func)

#@(promotion
    (defn fidelity-promo[order]
      (if (> order.customer.fidelity 1000)
          (* .05 (order.total))
          0)))

#@(promotion
    (defn bulk-item-promo[order]
      (setv discount 0)
      (for [item order.cart]
        (when (>= item.quantity 20)
          (+= discount (* .1 (item.total)))
          )
        )
      discount))

#@(promotion
    (defn large-order-promo[order]
      (setv distinct-items (sfor item order.cart item.product))
      (if (>= (len distinct-items) 10)
          (* .07 (order.total))
          0)))

(defn best-promo [order]
  (max (for [promo promos] (promo order))))
