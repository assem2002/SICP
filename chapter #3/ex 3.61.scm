(define (inverter ss)
  (define X
  (cons-stream 1 (- (mul-series (cdr-stream ss) X)) )))
