

(define (make-from-mag-ang x y )
  (define (dipatch op)
    (cond ((eq? op 'real-part) (* x (cos y) ))
          ((eq? op 'imag-part) (* x (sin y) ))
          ((eq? op 'mag) x)
          ((eq? op ''ang) y)))
  dispatch)

