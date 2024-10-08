

(define (averager a b c)
  (let (( u (make-connection))
        (v (make-connection))) 
    (adder a b u)
    (constant 0.5 v)
    (multiplier u v c)))
