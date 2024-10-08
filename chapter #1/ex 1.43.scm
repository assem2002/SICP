

(define (repeated func times)
  (define (internal-repeater given times)
    (if (= times 0 ) given (internal-repeater (compose func given) (- times 1))))
  (internal-repeater func (- times 1)))
((repeated square 2)5)

