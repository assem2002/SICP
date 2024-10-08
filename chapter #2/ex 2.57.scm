


(define (augend x) (if (null? (cdddr x)) (caddr x)
                       (append '(+) (cddr x))))
                       
                       
(define (multiplicand x) (if (null? (cdddr x)) (caddr x)
                             (append '(*) (cddr x))))
                             
             
                             
