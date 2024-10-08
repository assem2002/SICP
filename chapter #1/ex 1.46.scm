

(define (square x)
  (* x x))


(define (iterative-improve isgood improver)
  (lambda (guess) (if(isgood guess) (improver guess) ((iterative-improve isgood improver)(improver guess)))))

(define (squareRoot x)
  (define (isgoodSqrt guess) (< (abs(- (square guess) x)) 0.0001)) 
  ((iterative-improve isgoodSqrt (lambda (y) (/(+(/ x  y)y)2)))1))


(squareRoot 9)

