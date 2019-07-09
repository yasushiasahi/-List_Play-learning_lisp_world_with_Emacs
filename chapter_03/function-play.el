(defun my-1+ (n)
  (+ n 1))
my-1+

(my-1+ 5)
6

(defun my-1- (n)
  (- n 1))
my-1-

(my-1- 5)
4

(defun my-consp (x)
  (cond
   ((atom x) nil)
   (t t)))
my-consp

(defun my-consp-2 (x)
  (null (atom x)))
my-consp-2

(defun my-listp (x)
  (cond
   ((null x) t)
   ((consp x) t)
   (t nil)))
my-listp

(setq x 2)
2

(setq y 2)
2

(eq x y)
t

(setq z y)
2

(eq x z)
t

(setq x 'dog)
dog

(setq y 'dog)
dog

(eq x y)
t

(setq z y)
dog

(eq x z)
t

(setq x "dog")
"dog"

(setq y "dog")
"dog"

(eq x y)
nil

(setq z y)
"dog"

(eq x z)
nil

(eq y z)
t

(setq x '(1 2))
(1 2)

(setq y '(1 2))
(1 2)

(eq x y)
nil

(setq z y)
(1 2)

(eq x z)
nil

(eq y z)
t

(defun my-null (x)
  (eq x nil))
my-null

(defun my-minusp (n)
  (cond
   ((< n 0) t)
   (t nil)))
my-minusp

(defun leap (n)
  (cond
   ((/= (% n 4) 0) nil)
   ((/= (% n 100) 0) t)
   ((= (% n 400) 0) t)
   (t nil)))
leap

(leap 1400)
nil

(leap 1600)
t

(leap 2016)
t

(defun my-listp (x)
  (cond
   ((null x) t)
   ((consp x) t)
   (t nil)))

(defun my-listp-2 (x)
  (or (null x)
      (consp x)))
my-listp-2

(defun leap-2 (n)
  (and (= (% n 4) 0)
       (or (/= (% n 100) 0)
	   (= (% n 400) 0))))
leap-2

(defun leap-3 (n)
  (or (= (% n 400) 0)
      (and (= (% n 4) 0)
	   (/= (% n 100) 0))))
c
leap-3
