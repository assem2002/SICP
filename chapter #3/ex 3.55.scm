
(define (partial-sum seq)
	(define internal
	(cons-stream (car-stream seq) (add-stream (cdr-stream seq) internal) )))
