
(define (fringe l)
 (cond 
       ((null? l) nil)
  	((pair? (car l)) (append (fringe (car l)) (fringe (cdr l))))
       (else (cons (car l) (cdr l))))
  )
(define x (list (list 1 2) (list 3 4)))
 (fringe '((((5) 2) ((3 2) 9))))
 -----------------------------------------
