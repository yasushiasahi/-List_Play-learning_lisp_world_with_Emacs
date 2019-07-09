(defun facrorial (n)
  (cond
   ((zerop n) 1)
   (t (* n (facrorial (1- n))))))

;; (facrorial 5)
