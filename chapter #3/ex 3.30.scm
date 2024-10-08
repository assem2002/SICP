
(define (ripple-carry-adder A-list B-list s-list c)
	(define (ripple-carry-adder-iter A-list B-list s-list c-in c-out)
  	(if (null? A-list) c-in
   		(begin 
    	(full-adder (car A-list) (car B-list) c-in (car s-list) c-out)
  		(ripple-carry-adder (cdr A-list) (cdr B-list) (cdr s-list) c-out (make-wire)))))
  (set-signal! c (rippl-carry-adder-iter A-list B-list s-list (make-wire) (make-wire))))
  
