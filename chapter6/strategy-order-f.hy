;; 6-4
(import [abc [ABC abstractmethod]]
        [collections [namedtuple]])

(setv Customer (namedtuple "Customer" "name fidelity"))

(defclass LineItem []
  (defn --init-- [self product quantity price]
    (setv
      self.product product
      self.quantity quantity
      self.price price))
  (defn total [self]
    (* self.price self.quantity)))

(defclass Order []
  (defn --init-- [self customer cart &optional [promotion None]]
    (setv
      self.customer customer
      self.cart (list cart)
      self.promotion promotion))
  (defn total [self]
    (when (not (hasattr self "__total"))
      (setv self.--total (sum (gfor item self.cart (item.total)))))
    self.--total)
  (defn due [self]
    (setv discount
          (if (none? self.promotion)
              0
              (self.promotion self)
              ))
    (- (self.total) discount))
  (defn --repr-- [self]
    (setv fmt "<Order total: {:.2f} due: {:.2f}>")
    (fmt.format (self.total) (self.due))))

(defn fidelity-promo[order]
  (if (> order.customer.fidelity 1000)
      (* .05 (order.total))
      0))

(defn bulk-item-promo[order]
  (setv discount 0)
  (for [item order.cart]
    (when (>= item.quantity 20)
      (+= discount (* .1 (item.total)))
      )
    )
  discount)

(defn large-order-promo[order]
  (setv distinct-items (sfor item order.cart item.product))
  (if (>= (len distinct-items) 10)
      (* .07 (order.total))
      0))

;;6-6

(setv promos [fidelity-promo bulk-item-promo large-order-promo])

(defn best-promo [order]
  (max (gfor promo promos (promo order))))

;;6-7
(setv promos (lfor name (globals)
                   :if (and (.endswith name "_promo")
                            (!= name "best_promo"))
                   (get (globals) name)))

;;6-8
(import inspect sys)

(setv promos (lfor func (inspect.getmembers
                          ;; promotions -- module with just the strategies
                          (get sys.modules --name--)
                          inspect.isfunction)
                   func))

(comment
  (setv
    joe (Customer "John Doe" 0)
    ann (Customer "Ann Smith" 1100)
    cart [(LineItem "banana" 4 .5)
          (LineItem "apple" 10 1.5)
          (LineItem "watermellon" 5 5.0)])

  (Order joe cart fidelity-promo)
  (Order ann cart fidelity-promo)

  (setv banana-cart [(LineItem "banana" 30 .5)
                     (LineItem "apple" 10 1.5)])

  (Order joe banana-cart bulk-item-promo)

  (setv long-order (lfor item-code (range 10)
                         (LineItem (str item-code) 1 1.0)))
  (Order joe long-order large-order-promo)
  (Order joe cart large-order-promo)

  ;;6-5
  (Order joe long-order best-promo)
  (Order joe banana-cart best-promo)
  (Order ann cart best-promo)
  )


