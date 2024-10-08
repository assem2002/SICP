



(define (good-enough? x y) ( < (abs (- x y)) 0.00001) )
(define (fixed-point f x) 
  (let ((res (f x)))(display res)(newline)
    (if (good-enough? res x) res (fixed-point f res))) )
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2)


