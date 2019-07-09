(defun make-list2 (x y)
  (let (ret)
    (setq ret (cons y ret))
    (setq ret (cons x ret))))
make-list2

(make-list2 'a 'b)
(a b)

(defun sum2 (n1 n2)
  (let ((ret 0))
    (setq ret (+ ret n1))
    (setq ret (+ ret n2))
    ret))
sum2

(sum2 1 2)
3

(defun sum (lst)
  (let ((ret 0))
    (while lst
      (setq ret (+ ret (car lst)))
      (setq lst (cdr lst)))
    ret))
sum

(sum '(1 2 3 4 5))
15

(defun repl (lst old new)
  (let (ret)
    (while lst
      (cond
       ((eq (car lst) old) (setq ret (cons new ret)))
       (t (setq ret (cons (car lst) ret))))
      (setq lst (cdr lst)))
    ret))
repl

(repl '(a b c) 'b 'x)
(c x a)

(defun repl (lst old new)
  (let (tmp ret)
    (while lst
      (cond
       ((eq (car lst) old) (setq tmp (cons new tmp)))
       (t (setq tmp (cons (car lst) tmp))))
      (setq lst (cdr lst)))
    (while tmp
      (setq ret (cons (car tmp) ret))
      (setq tmp (cdr tmp)))
    ret))
repl

(repl '(a b c) 'b 'x)
(a x c)

(make-list 3 'dog)
(dog dog dog)

(defun my-make-list (n x)
  (let (rat)
    (while (not (zerop n))
      (setq rat (cons x rat))
      (setq n (1- n)))
    rat))
my-make-list

(my-make-list 3 'dog)
(dog dog dog)

(defun factorial (n)
  (let ((i 1) (fac 1))
    (while (<= i n)
      (setq fac (* i fac))
      (setq i (1+ i)))
    fac))
factorial

(factorial 5)
120

(defun fibonacci (n)
  (let ((x 1) (y 1) (i 3) tmp)
    (while (<= i n)
      (setq tmp y)
      (setq y (+ y x))
      (setq x tmp)
      (setq i (1+ i)))
    y))
fibonacci

(fibonacci 10)
55

(defun my-memq (x set)
  (catch 'loop
    (while set
      (cond
       ((eq x (car set)) (throw 'loop t))
       (t (setq set (cdr set)))))))
my-memq

(my-memq 'x '(a b c x d))
t

t

(my-memq 'x '(a b c e d))
nil

nil

(defun my-assq (key alist)
  (catch 'loop
    (while alist
      (if (eq key (caar alist))
	  (throw 'loop (car alist)))
      (setq alist (cdr alist)))))
my-assq

(my-assq 'x '((a . 1) (b . 2) (x . 0) (c .3)))
(x . 0)


(defun my-memq (x set)
  (catch 'loop
    (while set
      (cond
       ((eq x (car set)) (throw 'loop t)))
      (setq set (cdr set)))))


(defun my-memq* (x set)
  (catch 'loop
    (while set
      (cond
       ((eq x (car set)) (throw 'loop t))
       ((consp (car set))
	(let ((inset (car set)))
	  (while inset
	    (cond
	     ((eq x (car inset)) (throw 'loop t)))
	    (setq inset (cdr inset))))))
      (setq set (cdr set)))))
my-memq*


(my-memq* 'x '(a (b c) (e x) d))
t

(my-memq* 'x '(a (b c) (e (z x)) d))
nil

(defun my-memq* (x set)
  (catch 'loop
    (while set
      (cond
       ((eq x (car set)) (throw 'loop t))
       ((and (consp (car set))
	     (my-memq* x (car set)))
	(throw 'loop t)))
      (setq set (cdr set)))))
my-memq*

(my-memq* 'x '(a (b c) (e (z x)) d))
t
