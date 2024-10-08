
(define (find item-pointer l)
  (cond ((null? l) false)
        ((eq? (car l) item-pointer) true)
        (else (find item-pointer (cdr l)))))




(define (has-cycle? l)
  (define visited '())
  (define (internal x) 
    (cond ((null? x) false )
          ((find x visited) true)
          (else (begin (set! visited (cons x visited)) (internal (cdr x)) ))))
  (internal l))
