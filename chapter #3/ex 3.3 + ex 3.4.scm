(define (make-account user-password balance)
	(define wrong-entries 0)
	(define (reset) (set! wrong-entries 0))
  	(define (increment) (set! wrong-entries (+ wrong-entries 1)))
(define (withdraw amount)
	(if (>= balance amount)
		(begin (set! balance (- balance amount))
		balance)
		"Insufficient funds"))
(define (deposit amount)
	(set! balance (+ balance amount))
	balance)
(define (dispatch entered-password m)
  (cond ((eq? entered-password user-password) 
		(reset)(cond ((eq? m 'withdraw) withdraw)
		((eq? m 'deposit) deposit)
		(else (error "Unknown request: MAKE-ACCOUNT"m))))
      ((>= wrong-entries 2) (error "call-the-cops!"))
        (else (increment) (error "Wrong Password!!") )))
	dispatch)
(define w (make-account 'pass 100))
;((w 'passs 'deposit) 10)
;((w 'passs 'deposit) 10)
;((w 'pass 'deposit) 10)
;((w 'passs 'deposit) 10)
;((w 'passs 'deposit) 10)
;((w 'passs 'deposit) 10)




