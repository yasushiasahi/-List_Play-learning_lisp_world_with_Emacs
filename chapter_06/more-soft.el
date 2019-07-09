7
7

(defun calc (exp)
  (funcall ))

(defun calc (exp)
  (cond
   ((atom exp) exp)
   ((eq (cadr exp) '+)
    (+ (calc (car exp))
       (calc (caddr exp))))
   ((eq (cadr exp) '-)
    (- (calc (car exp))
       (calc (caddr exp))))
   ((eq (cadr exp) '*)
    (* (calc (car exp))
       (calc (caddr exp))))))
calc

(calc '(1 + (2 * 3)))
7

(defun op (exp) (cadr exp))
op

(defun arg1 (exp) (car exp))
arg1

(defun arg2 (exp) (caddr exp))
arg2

(defun calc (exp)
  (cond
   ((atom exp) exp)
   ((eq (op exp) '+)
    (+ (calc (arg1 exp))
       (calc (arg2 exp))))
   ((eq (op exp) '-)
    (- (calc (arg1 exp))
       (calc (arg2 exp))))
   ((eq (op exp) '*)
    (* (calc (arg1 exp))
       (calc (arg2 exp))))))
calc

(calc '(1 + (2 * 3)))
7

(setq op-func1 '((+ . +) (- . -) (* . *)))
((+ . +) (- . -) (* . *))

((+ . +) (- . -) (* . *))

(assoc '+ op-func1)
(+ . +)

(defun op-func (sym op-db)
  (cdr (assoc sym op-db)))
op-func

(op-func '- op-func1)


(funcall '+ 1 2)
3

(defun op (exp) (cadr exp))
(defun arg1 (exp) (car exp))
(defun arg2 (exp) (caddr exp))

(setq op-func1 '((+ . +) (- . -) (* . *)))
(defun op-func (sym op-db)
  (cdr (assoc sym op-db)))

(defun calc (exp op-db)
  (cond
   ((atom exp) exp)
   (t (funcall (op-func (op exp) op-db)
	       (calc (arg1 exp) op-db)
	       (calc (arg2 exp) op-db)))))
calc

(calc '(1 + 1) op-func1)
2

(setq op-func2 '((add . +) (sub . -) (mul . *)))
((add . +) (sub . -) (mul . *))

(calc '(1 add (1 sub (2 mul 2))) op-func2)
-2

(defun 1st (exp) (car exp))
1st

(defun 2nd (exp) (cadr exp))
2nd

(defun 3rd (exp) (caddr exp))
3rd

(setq order-func1 '((OP . 2nd) (ARG1 . 1st) (ARG2 . 3rd)))
((OP . 2nd) (ARG1 . 1st) (ARG2 . 3rd))

(defun order-func (sym odr-db)
  (cdr (assoc sym odr-db)))
order-func

(defun op (exp odr-db)
  (funcall (order-func 'OP odr-db) exp))
op

(defun arg1 (exp odr-db)
  (funcall (order-func 'ARG1 odr-db) exp))
arg1

(defun arg2 (exp odr-db)
  (funcall (order-func 'ARG2 odr-db) exp))
arg2

(defun calc (exp op-db odr-db)
  (cond
   ((atom exp) exp)
   (t (funcall (op-func (op exp odr-db) op-db)
	       (calc (arg1 exp odr-db) op-db odr-db)
	       (calc (arg2 exp odr-db) op-db odr-db)))))
calc

(calc '(1 + (2 * 3)) op-func1 order-func1)
7

(setq order-func2 '((OP . 1st) (ARG1 . 2nd) (ARG2 . 3rd)))
((OP . 1st) (ARG1 . 2nd) (ARG2 . 3rd))

(calc '(add 1 (mul 2 3)) op-func2 order-func2)
7
