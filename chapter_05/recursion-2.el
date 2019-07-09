(defun sum* (lst)
  (cond
   ((null lst) 0)
   ((consp (car lst))
    (+ (sum* (car lst)) (sum* (cdr lst))))
   (t (+ (car lst) (sum* (cdr lst))))))
sum*

(sum* '(1 2 (3 4) (5)))
15

(sum* '((1 (2 (3 (4)) 5))))
15

(defun repl* (lst old new)
  (cond
   ((null lst) nil)
   ((consp (car lst)) (cons (repl* (car lst) old new)
			    (repl* (cdr lst) old new)))
   ((eq old (car lst)) (cons new
			     (repl* (cdr lst) old new)))
   (t (cons (car lst)
	    (repl* (cdr lst) old new)))))
repl*

(repl* '(a (a b c) c (d (c ((c)))) c) 'c 'x)

(defun del* (x lst)
  (cond
   ((null lst) nil)
   ((consp (car lst))
    (cons (del* x (car lst))
	  (del* x (cdr lst))))
   ((eq x (car lst))
    (del* x (cdr lst)))
   (t (cons (car lst)
	    (del* x (cdr lst))))))
del*

(del* 'c '(a b c d e c g))
(a b d e g)

(del* 'c '(a (b c) (d e (c)) g))
(a (b) (d e nil) g)

(del* 1 '(1 (1) (1 2) (1 (1 3))))
(nil (2) ((3)))

(defun my-memq* (x set)
  (cond
   ((null set) nil)
   ((consp (car set))
    (or (my-memq* x (car set))
	(my-memq* x (cdr set))))
   ((eq (car set) x) t)
   (t (my-memq* x (cdr set)))))
my-memq*

(my-memq* 'a '(b c a d e))
t

(my-memq* 'a '(b (c a) d e))
t

(defun equiv* (x y)
  (cond
   ((and (null x) (null y)) t)
   ((or (null x) (null y)) nil)
   ((and (consp (car x)) (consp (car y)))
    (and (equiv* (car x) (car y))
	 (equiv* (cdr x) (cdr y))))
   ((not (eq (car x) (car y))) nil)
   (t (equiv* (cdr x) (cdr y)))))
equiv*

equiv*

equiv*

(equiv* '(a b c d) '(a b c))
nil

(equiv* '(a (b c) (e f)) '(a b c (e f)))
nil

(equiv* '(dog (pig)) '(dog (pig)))
t

(setq moo '(1 2))
(1 2)

(setq coo (cons (car moo) (cdr moo)))
(1 2)

(eq moo coo)
nil

(equal moo coo)
t
