
(define (equal? l1 l2)
  (cond ((and(null? l1)(null? l2)) true)
        ((or (null? l1)(null? l2)) false)
        ((and (pair? (car l1))(pair? (car l2))) (if (equal? (car l1)(car l2)) (equal? (cdr l1)(cdr l2)) false))
        ((not(eq? (car l1) (car l2) )) false)
        (else (equal? (cdr l1) (cdr l2)))
        )
  )


(equal? '(q (a b) c (l) ) '(q (a b) c (l) ) )

