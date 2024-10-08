
(define (inverter ss)
  (define X
  (cons-stream 1 
               (lambda (y) 
                 (if (= y 0)
                     (error "division by zero") y))
               (- (mul-series (cdr-stream ss) X)))))


(define (divide-series s1 s2)
  (mul-series s1 (inverter s2)))
