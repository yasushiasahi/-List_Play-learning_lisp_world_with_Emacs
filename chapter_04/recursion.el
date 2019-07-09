(defun arith-prog (n)
  (cond ((zerop n) 0)
	(t (+ n (arith-prog (- n 1))))))
arith-prog

(arith-prog 10)
55

(defun geom-prog (n)
  (cond ((zerop n) 1)
	(t (+ (expt 2 n) (geom-prog (1- n))))))
geom-prog

(geom-prog 10)
2047

(defun geom-prog1 (n)
  (cond ((zerop n) 1)
	(t (+ 1 (* 2 (geom-prog1 (1- n)))))))
geom-prog1

(defun fibonacci (n)
  (cond ((= n 1) 1)
	((= n 2) 1)
	(t (+ (fibonacci (- n 1))
	      (fibonacci (- n 2))))))

(fibonacci 20)
6765

(defun sum (list)
  (cond ((null list) 0)
	(t (+ (car list)
	      (sum (cdr list))))))
sum

(sum '(1 2 3 4 5))
15

(defun reql (lst old new)
  (cond
   ((null lst) nil)
   ((equal (car lst) old) (cons new (reql (cdr lst) old new)))
   (t (cons (car lst) (reql (cdr lst) old new)))))

(reql '(dog pig dog) 'dog 'rat)
(rat pig rat)

(defun del (x lst)
  (cond
   ((null lst) nil)
   ((equal x (car lst)) (del x (cdr lst)))
   (t (cons (car lst) (del x (cdr lst))))))
del

(del 'pig '(rat pig dog pig))
(rat dog)

(defun memq (x lst)
  (cond
   ((null lst) nil)
   ((eq x (car lst)) t)
   (t (memq x (cdr lst)))))
memq

(memq 3 '(1 2 3))
t

(memq 3 '(1 2 4))
nil

(memq 'dog '(pig rat))
nil

(defun subset (set1 set2)
  (cond
   ((null set1) t)
   ((memq (car set1) set2)
    (subset (cdr set1) set2))
   (t nil)))
subset

(setq alst '((rose . "red") (violet . "blue") (lily . "white")))
((rose . "red") (violet . "blue") (lily . "white"))

(assoc 'rose alst)

(defun assq (key alst)
  (cond
   ((null alst) nil)
   ((eq key (caar alst)) (car alst))
   (t (assq key (cdr alst)))))
assq

(assq 'rose alst)
(rose . "red")

(defun equiv (lst1 lst2)
  (cond
   ((and (null lst1) (null lst1)) t)
   ((not (eq (car lst1) (car lst2))) nil)
   (t (equiv (cdr lst1) (cdr lst2)))))
equiv

(equiv '(a b c) '(a b c))
t

(equiv '(a b c) '(a x c))
nil
