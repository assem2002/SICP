



(define (variable? x) (symbol? x))


(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))


(define (=number? expr num)
  (and (number? expr) (= expr num)))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        ;(else (list '+ a1 a2))))
        (else (list  a1 '+ a2))))



(define (sum? expr)
  ;(and (pair? expr) (eq? (car expr) '+)))
(and (pair? expr) (eq? (cadr expr) '+)))
;(define addend cadr )
(define addend car)

(define (augend x) (if (null? (cdddr x)) (caddr x)
                        (cddr x)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        ;(else (list '* m1 m2))))
        (else (list  m1 '* m2))))




(define (product? expr)
  ;(and (pair? expr) (eq? (car expr) '*)))
  (and (pair? expr) (eq? (cadr expr) '*)))

;(define multiplier cadr)
(define multiplier car)

(define multiplicand caddr)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (exponentiation? expr)(and (pair? expr) (eq? '** (cadr expr))) )
(define (expon expr) (caddr expr))
(define (base expr ) (car expr ) )
(define (make-exponent base expon) (cond((= expon 0) 1)
                                        ((= expon 1) base)
                                        ((=number? base 1) 1)
                                       (else (list base '** expon))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




(define (deriv exp var)
(cond ((and (pair? exp) (null?(cdr exp)))  (deriv (car exp) var)) 
 	((number? exp) 0)
      
((variable? exp) (if (same-variable? exp var) 1 0))
      ((exponentiation? exp) (make-product ( make-product (expon exp)
                                     			(make-exponent (base exp) (-(expon exp)1)))
                                   (deriv (base exp) var))
 )
((sum? exp) (make-sum (deriv (addend exp) var)
(deriv (augend exp) var)))
((product? exp) (let((res
(make-sum
(make-product (multiplier exp)
(deriv (multiplicand exp) var))
(make-product (deriv (multiplier exp) var)
(multiplicand exp)))))
                  (cond 
                   		(( null? (cdddr exp) ) res ) 
                        ((eq? (cadddr exp) '+) (make-sum res (deriv (cddddr exp) var)) )
                        ( (eq? (cadddr exp) '*)   (make-product res (deriv (cddddr exp ) var)) )
                        ) ))
(else
(error "unknown expression type: DERIV" exp))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(deriv '(+ x 3 (* 3 x) (* x y) ) 'x)
;(deriv '(* x y) 'x)
;(deriv '(* x  (+ x 4) (+ x 3)) 'x)

;(deriv '(* (* x y) 0) 'x)
;(deriv '(**(* x y) 2) 'x)
;(deriv '(* x y (+ x 3)) 'x)
(deriv '(x + 3 + x) 'x)
(deriv '(x ** 3) 'x)
(deriv '(x * 3   ) 'x)
(deriv'(x + 3 * (x + y + 2)) 'x)
(deriv '(3 * (x + y * 2) + x + 1) 'x)


