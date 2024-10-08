

(define one (lambda(f) (lambda (x) (f x) )))
(define two (lambda(f) (lambda (x) (f(f x)) )))

(define (addition n1 n2) 
  (lambda(f) (lambda (x) (n2(n1 (f x) )))
  
  
