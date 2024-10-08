
(define (integrate-series s)
  (define local-state 1)
  (define (internal ss)
    (cons-stream (begin (set! local-state (+ local-state 1)) 
                        (* (/ 1 (- local-state 1)) (stream-car ss)) 
                 (internal (stream-cdr ss)))))
  (internal s))
; We can use the 'integers starting from' stream which will do the local state job.

(define (integrate-series s)
 (stream-map / s (integer-starting-from 1)))

;Extremely tricky
(define (negate-series s)(cons-stream (- (car-stream s)) (cdr s) ))
(define cosine-series (cons-stream 1 (negate-series (integrate-series sine-series))))
(define sine-series (cons-stream 0 (integrate-series cosine-series)))

