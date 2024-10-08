


(define exist '() )
(define (count-pairs x)
      (cond ((or (not (pair? x)) (memq x exist) ) 0)
          (else (set! exist (cons x exist)) (+ (count-pairs (cdr x))
             (count-pairs (car x)) 1))))
