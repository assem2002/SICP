

(define (or-gate a1 a2 output)
  (let ((a1-neg (make-wire)) 
         (a2-neg (make-wire))
        (res (make-wire)))
    (inverter a1 a1-neg)
    (inverter a2 a2-neg)
    (and-gate a1-neg a2-neg res)
    (inverter res output)
    'ok))
;there's 4 types of delays in this function; but when such a function is invoked only one of the first two inverters is gonna work,so the total delay is (inverter-delay + and-gate-delay + inverter-delay)  
