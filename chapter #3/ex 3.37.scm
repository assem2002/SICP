(define (c- a b)
  (let ((z (make-connector))) 
    (adder a (- b) z)
    z))
(define (c/ a b)
  (let ((z (make-connector))) 
    (if (= b 0) (error "division by 0")
        (begin
         (multiplier z b a)
         z))))
(define (c* a b)
  (let ((z (make-connector)))
    (multipler a b z)
    z))
(define (cv x)
  (constant x cv))
