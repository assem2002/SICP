


(define (subsets s)
(if (null? s)
(list nil)
(let ((rest (subsets (cdr s))))
(append  (map (lambda (x) (cons (car s) x )) rest)rest))))
(subsets '(1 2 3 ))


