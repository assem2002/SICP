
(define (good-enough x y)(< (abs (- x y)) 0.00001))
(define (fixed-point f guess)
  (define (try-again result guess)
    (if (good-enough result guess) result (try-again (f result) result)))
  (try-again (f guess) guess))



(define dx 0.000001)
(define (derivFormula g) 
  (lambda (x) (/ (- (g (+ x dx)) (g x) ) dx) ) )

(define (newtonFormula f)
  (lambda (x) (- x (/(f x) ((derivFormula f)x)))))

(define (gerneralFixedPoint f transfrom guess)
  (fixed-point (transfrom f) guess) )

(define (newtonMethod func guess) 
  (fixed-point (newtonFormula func) guess ) )

(define (find-cubic a b c)
  (newtonMethod (lambda (x) (+(* x x x )(* x x a)(* x b) c) ) 1))
(find-cubic 1 1 1)



