
(define (random) 
  (define x inital-x)
  (define (reset newX) (set! x newX ))
  (define (generate) (begin (set! x (rand-update x)) x))
  (define (dispatch m)
    (cond ((eq? m 'generate ) (generate))
          ((eq? m 'reset) reset)
          (else (error "wrong Choice!!"))))
  dispatch)

(define rand (random))
((rand 'reset) 20)
(rand 'generate)
(rand 'generate)
((rand 'reset) 20)
(rand 'generate)

