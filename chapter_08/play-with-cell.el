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

(repl '(1 2 3) 2 5)
(1 5 3)

(setq zoo '(dog pig))
(dog pig)

(setq goo (cons 'rat zoo))
(rat dog pig)

zoo
(dog pig)

(setq zoo '(cat deer))
(cat deer)

goo
(rat dog pig)

(setq zoo '(1))
(1)

(setcar zoo 2)
2

zoo
(2)

(setcdr zoo 3)
3

zoo
(2 . 3)

(setq zoo '(dog pig))
(dog pig)

(setq x 2)
2

(defun func (l n)
  (setq l '(rat))
  (setq n 3))
func

(func zoo x)
3

zoo
(dog pig)

x
2

(setq zoo '(dog pig))
(dog pig)

(defun func (l)
  (setcar l 'rat))
func

(func zoo)
rat

zoo
(rat pig)

(setq zoo '(dog))
(dog)

(setq zoo '(rat pig))
(rat pig)

(setcdr zoo nil)
nil

zoo
(rat)

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

(defun my-nreverse (lst)
  (let ((this lst) prev next)
    (while this
      (format "this:%S prev:%S next:%S" this prev next)
      (setq next (cdr this))
      (setcdr this prev)
      (setq prev this)
      (setq this next))
    prev))
my-nreverse

(my-nreverse '(a b c d))

(setq zoo '(1 2))
(1 2)

(setq goo '(3))
(3)

(append zoo goo)
(1 2 3)

zoo
(1 2)

(nconc zoo goo)
(1 2 3)

zoo
(1 2 3)
