


(define (map procedure items)
  (if (null? items) nil
      (cons (procedure (car items)) (map procedure (cdr items)))))
(define (square-list l)
  (map (lambda(x) (* x x)) l))
(define (square-list1 l)
  (if (null? l) nil(cons (*(car l) (car l)) (square-list1 (cdr l)) )))
(square-list1 (list 1 2 3 4))

