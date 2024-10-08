

(define (inc x)(+ x 1))
(define (double f) (lambda (x) (f (f x)) ))
(lambda (x) (double (double x)) )
(lambda (x) (s (s x)) )
(((double (double double)) inc) 4)


explaination:


