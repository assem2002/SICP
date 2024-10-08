
(define (stream-limit s tolerance)
  (define (internal ss)
    (if (<= (abs (- (stream-cdr ss) (stream-car ss))
         tolerance))
        (stream-cdr ss)
        (internal (stream-cdr))))
        (internal s))	
        
