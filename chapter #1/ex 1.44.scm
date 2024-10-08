
(define (smooth func)
            (lambda (x) (/ (+(func x)(func (- x dx)) (func (+ x dx))) 3)))
              
(define (smooth-N func n)
  (repeated (smooth func) n))
