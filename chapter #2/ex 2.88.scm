

(define (new-installation-to-polynomials)
    (define (make-negated cur-term-list) 
    	(if (null? cur-term-list ) the-empty-term-list 
            (let ((first (first-term cur-term-list)) 
                  (rest (rest-terms cur-term-list)))
                  (adjoin-term 
                   			(make-term (order first) (mul (coeff first) -1 )) 
                   			(make-negated rest)))))
  
  (define (sub-polynomials p1 p2 ) 
    (cond ((same-variable? (variable p1) (variable p2)) 
           (make-poly (variable p1)
                     (add-term (term-list p1)
                     (make-negated (term-list p2)))))
          (else (error "polys to the same variable SUB-POLYNOMIALS"))))
  (put 'sub '(polynomial polynomial) sub-polynomials ))
