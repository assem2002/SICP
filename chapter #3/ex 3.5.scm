
(define (square x) (* x x))
(define (monte-carlo trials experiment)
	(define (iter trials-remaining trials-passed)
		(cond ((= trials-remaining 0)
				(/ trials-passed trials))
			  ((experiment)
				(iter (- trials-remaining 1)
				(+ trials-passed 1)))
			  (else (iter (- trials-remaining 1)
							trials-passed))))
	(iter trials 0))

(define (random-in-range low high)
	(let ((range (- high low)))
	(+ low (random range))))

(define (integral1-predicate x y) 
  (<= (+ (square (- x 5)) (square (- y 5))) 1))

(define (estimate-integral p x1 x2 y1 y2 trials)
  (define (exper) (p 
                 (random-in-range x1 x2) (random-in-range y1 y2)))
 	(define area ( * (- x2 x1) (- y2 y1) ) )
  (* area (monte-carlo trials exper )))
(estimate-integral integral1-predicate 4 6 4 6 1000)

