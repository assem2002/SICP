


(define (square x)
  (* x x))

(define (map procedure l)
  (if (null? l) nil
      (cons (procedure (car l)) (map procedure (cdr l)) ))
  )

(define (square-tree l)
  (cond ((null? l) nil)
        ((number? l) (square l))
        (else (cons (square-tree (car l)) (square-tree (cdr l)) ))
        ))

(define (square-tree-mapped l)
  (map (lambda (x) (if (pair? x) (square-tree-mapped x) (square x) )) l)
  )
(square-tree-mapped
(list 1
(list 2 (list 3 4) 5)
(list 6 7)))
;(1 (4 (9 16) 25) (36 49))


