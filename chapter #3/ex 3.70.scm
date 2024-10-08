
(define (merge-weighted s1 s2 w)
	(cond ((stream-null? s1) s2)
	 	((stream-null? s2) s1)
		(else (let ((first(w (stream-car s1)))
			(second (w (stream-car s2))))
			(cond (( < first second) (cons-stream s1 (merge-weighted (stream-cdr s1) s2 w)))
				(else (cons-stream s2 (merge-weighted s1 (stream-cdr s2) w))))))))
				

(define (interleave s1 s2 w)
(if (stream-null? s1)
s2
(merge-weighted (stream-car s1)
(interleave s2 (stream-cdr s1)) w )))

(define (pairs-weighted s t w)
(merge-weighted
(list (stream-car s) (stream-car t))
(interleave
(stream-map (lambda (x) (list (stream-car s) x))
(stream-cdr t))
(pairs-weighted (stream-cdr s) (stream-cdr t)) w )))

