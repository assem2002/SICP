
(define (successive-merge orderedLeaves)
  (if (null?(cdr orderedLeaves)) (car orderedLeaves)
      (successive-merge 
       (adjoin-set 
        (make-code-tree (car orderedLeaves) (cadr orderedLeaves)) 
        (cddr orderedLeaves)))))
  
