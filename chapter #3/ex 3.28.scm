

(define (or-gate a1 a2 output) 
  (define (or-gate-procedure)
    (let ((new-value (logical-or (get-signal a1) (get-signal a2)))) 
      (after-delay or-gate-delay (lambda ()
                                   		(set-signal! output new value)))))
  (add-action! a1 or-gate-procedure)
  (add-action! a2 or-gate-procedure)
  'ok)
  
