

(define (exponentiation? expr)(and (pair? expr) (eq? '** (car expr))) )
(define (expon expr) (caddr expr))
(define (base expr ) (cadr expr ) )
(define (make-exponent base expon) (cond((= expon 0) 1)
                                        ((= expon 1) base)
                                        ((=number base 1) 1)
                                       (else (list '** base expon))))

(define (deriv exp var)
(cond ((number? exp) 0)
((variable? exp) (if (same-variable? exp var) 1 0))
      ((exponentiation? exp) (make-product ( make-product (expon exp)
                                     			(make-exponent (base exp) (-(expon exp)1)))
                                   (deriv (base exp) var))
 )
((sum? exp) (make-sum (deriv (addend exp) var)
(deriv (augend exp) var)))
((product? exp)
(make-sum
(make-product (multiplier exp)
(deriv (multiplicand exp) var))
(make-product (deriv (multiplier exp) var)
(multiplicand exp))))
(else
(error "unknown expression type: DERIV" exp))))
