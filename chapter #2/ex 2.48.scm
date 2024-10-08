 
 (define (make-seg v1 v2) (cons v1 v2))
(define (start-seg seg) (car make-seg))
(define (end-seg seg) (cdr make-seg))
