 
(define (make-mobile left right)
(list left right))
(define (make-branch length structure)
(list length structure))


(define (left-branch mobile)(car mobile) )
(define (right-branch  mobile) (car(cdr mobile)))
(define (branch-length branch)(car  branch))
(define (branch-structure branch) (car(cdr branch)))


(define (total-weight mobile)
  (cond ((null? mobile) 0 ) 
        ((pair? (branch-structure mobile) ) (+(total-weight (left-branch mobile)) (total-weight (right-branch mobile))) )
        (else (branch-structure mobile)))
  )


