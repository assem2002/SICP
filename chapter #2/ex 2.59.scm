(define (union-set s1 s2) 
  (if (null? s1 ) s2
      (union-set (cdr s1) (adjoin-set (car s1) s2)) ) 
  )
  
