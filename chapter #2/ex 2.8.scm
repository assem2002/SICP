

(define (max a b)(if (> a b) a b))
(define (min a b)(if (< a b) a b))

(define (make-interval a b) (cons a b))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (higher-bound interval) (max (car interval) (cdr interval)))
(higher-bound (make-interval 3 4) )
 
 
 ;it's seems weird but, it's just arthimtic intervals subtraction.
(define (sub-interval a b )
  (make-interval (- (lower-bound a) (higher-bound b))
                 (- (higer-bound a) (lower-bound b))
                 ))
                 

