
(define (max a b)(if (> a b) a b))
(define (min a b)(if (< a b) a b))

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (higher-bound interval) (max (car interval) (cdr interval)))
(higher-bound (make-interval 3 4) )

