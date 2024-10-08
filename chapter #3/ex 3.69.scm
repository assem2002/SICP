
(define (triples s t u)
	(cons-stream
	(list (stream-car s) (stream-car t) (stream-car u))		
	(interleave 
		(stream-map (lambda (x) (list (stream-car s) (stream-car t) x)) u) 
		(interleave
			(stream-map (lambda (x) (list (stream-car s) x (stream-car u) )) t)
				(interleave
			(stream-map (lambda (x) (list x (stream-car t) (stream-car u) )) t) ; I think this is reduendent to what we want to achive
				(triples (stream-cdr s) (stream-cdr t) (stream-cdr u) )))))
