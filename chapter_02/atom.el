(setq zoo nil)
nil

(null zoo)
t

(null t)
nil

(null 'a)
nil

(null "")
nil

(null 0)
nil

18
18

-24
-24

"dog"
"dog"

"Dog"
"Dog"

"-24"
"-24"

"this is a \n pen"
"this is a
 pen"

'(1 2 3)
(1 2 3)

(cons 1 nil)
(1)

(cons 1 ())
(1)

(cons 1 (cons 2 (cons 3 nil)))
(1 2 3)

(consp 1)
nil

(setq zoo (cons 1 nil))
(1)

(consp zoo)
t

(atom 1)
t

(atom zoo)
nil

(atom nil)
t

(consp nil)
nil

(listp nil)
t

(listp 1)
nil

(listp zoo)
t

(setq zoo (cons 1 (cons 2 (cons 3 nil))))
(1 2 3)

(car zoo)
1

(cdr zoo)
(2 3)

(car nil)
nil

(cdr nil)
nil

(setq moo (cons 1 (cons 2 nil)))
(1 2)

(setq coo (cons 3 (cons 4 nil)))
(3 4)

(cons moo (cons coo nil))
((1 2) (3 4))

'(1 . 2)
(1 . 2)

(setq hoo '(1 . 2))
(1 . 2)

(car hoo)
1

(cdr hoo)
2
