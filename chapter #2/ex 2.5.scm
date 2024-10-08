

(define (square x)
  (* x x))

(define (pow base exp)
  (cond ((= exp 0) 1)
      ((even? exp) (pow (square base) (/ exp 2)))
      (else (* base (pow base (- exp 1))))
        ))


(define (iterNum n div i)
  (if (>(remainder n div)0) i (iterNum (/ n div ) div (+ i 1) )))


(define (cons x y)
  (*(pow 2 x) (pow 3 y))) ;prime works for such a representation.
(define (car x) 
  (iterNum x 2 0 ))
(define (cdr x) 
  (iterNum x 3 0))


