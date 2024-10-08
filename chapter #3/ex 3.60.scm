
(define (mul-series s1 s2)
(cons-stream (* (car-stream s1 ) (car-stream s2)) 
	(add-stream (scale-stream  (cdr-stream s1) (car-stream s1) )
	(mul-stream s2	 (cdr-stream s1) ))))
