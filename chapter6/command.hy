;;6-9
(defclass MacroCommand []

  (defn --init-- [self commands]
    (setv self.commands (list commands)))
  (defn --call-- [self]
    (for [command self.commands]
      (command))))
