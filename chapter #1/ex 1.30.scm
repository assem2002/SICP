

(define (sum term a next b)
(define (iter a result)
(if (> a b ) result
(iter (next a)  (+ result (term a)) )))
(iter a 0))
ex.1.31





(define (product term a next b)
  (if (> a b) 1
      (* (term a ) (product term (next a) next b) )))


(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b) result
        (iter (next a) (* result (term a) ))))
  (iter a 1))


(define (res x) (*(/ x (- x 1)) (/ x (+ x 1))) )
(define (nextt x) (+ x 2))

(define (get-pi limit)
  (* (product-iter res 2 nextt limit) 2))
(get-pi 2000)
