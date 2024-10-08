(define (solve)
	(define weight (lambda (x) (+ (square (car x)) (square (cdr x)))))
	(define seq (pairs-weighted integers integers weight))
	(define (filter s)
		(cond ((= (w (stream-car s))
				(w (car(stream-cdr s)))
				(w (car(stream-cdr (stream-cdr s)))))
				(cons-stream (w (stream-car s))
				(filter (stream-cdr s))))
		(else (filter(stream-cdr s))))))



				


