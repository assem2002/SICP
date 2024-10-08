
(define (union-set s1 s2)
  (cond ((null? s1) s2)
        ((null? s2) s1)
   (else
  (let ((x1 (car s1) ) (x2 (car s2)))
    (cond 
     ((= x1 x2) (cons x1 (union-set (cdr s1)(cdr s2))) )
      ((< x1 x2) (cons x1 (union-set (cdr s1) s2)) )  
    	((> x1 x2) (cons x2 (union-set s1 (cdr s2)) ) )
        )))))
(union-set '(1 2 4 7) '( 1 4 5 6 7))
; it's like merge sort kinda stuff


