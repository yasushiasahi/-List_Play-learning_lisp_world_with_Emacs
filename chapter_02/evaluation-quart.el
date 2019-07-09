(quote (1 2))
(1 2)

'(1 2)
(1 2)

(setq dog 5)
5

dog
5

'dog
dog

(setq dog 1)
1

(setq pig 2)
2

(cons dog (cons pig nil))
(1 2)

'(dog pig)
(dog pig)

`(,dog ,pig)
(1 2)

(setq zoo '(t nil 18 "dog"))
(t nil 18 "dog")

(setq flowers '((rose . "red") (violet . "blue")))
((rose . "red") (violet . "blue"))
