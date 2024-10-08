


(define (accumulator combine null-value term a next b)
  (if (> a b) null-value
  (combine (term a) (accumulator combine null-value term (next a ) next b ))))

(define (cc x y )(+ x y ) )
(define (tt x) x)
(define (nn x) (+ x 1))
(accumulator cc 0 tt 1 nn 10)



(define (accumulator-iter combine null-value term a next b)
  (define (acc-helper a result)
    
    (if (> a b) result
        (acc-helper (next a ) (combine result (term a )) )))
  (acc-helper a null-value))


(accumulator-iter cc 0 tt 1 nn 10)








