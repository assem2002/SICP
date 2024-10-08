
(define (for-each procedure items)
        (cond ((null? items) true)
            (else (procedure (car items)) (for-each procedure (cdr items)) )))

(for-each (lambda (x)
(newline)
(display x))
(list 57 321 88))
