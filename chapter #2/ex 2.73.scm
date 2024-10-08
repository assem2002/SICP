a)

;what happened : we made a whole a table with indeces (operation (which is just deriv operation) , operators), so based on the operation there's gonna be a certain procedure returened to handle this
; case, though this doesn't much of sense as you have one way of handling the derivation of + or * or whatever.

; why can't we use the predicate number and variable in the table (date directed way)? : the data directed dispatch supposes that the data sent has a tag (type) that corresponds to some procedure in 
;the genreric interface we made but with numbers there's no tag unless you make it like that "(number 1)" which isn't what expected from the user, and for the variable predicate it also needs a tag;
; while something like + - * is a tag for specifc type of deriv procedure,we just dispatch it and operate on the data.
;;;;;;;;;;
b)

(define addened car)
(define augend cadr)
(define multipler car )
(define multiplicand cadr)

;The followings are just different implemntations in case you want to handle multiple argument in the experssion. 

;(define (multiplicad exp) 
;  (if (null?(cddr exp)) (cadr exp)  
;                           (list '* (cdr exp)) ))
;(define (augend exp) 
;  (if (null? (cddr exp)) (cadr exp)
;      (list '+ (cdr exp))))


(define (install-deriv-sum) 
  (define (deriv-sum exp var) ( 
    (make-sum (deriv (addend exp) var)
		(deriv (augend exp) var))))
  (put 'deriv '+ deriv-sum))


(define (install-deriv-product)
  (define (deriv-product exp var) 
    ((make-sum (make-product
				(multiplier exp)
				(deriv (multiplicand exp) var))
					(make-product
					(deriv (multiplier exp) var)
					(multiplicand exp)))))
  
  
  (put 'deriv '* deriv-product ) )
;;;;;;;;;;;;;;;;;;;;;;;
  
  
c)  

(define base car)
(define exponent cadr)

(define (make-exponent base expon)
  (cond ((= expon 0) 1)
        ((= expon 1) base)
  		(else (list '** base expon))))


(define (install-deriv-exponent)
(define base car)
(define exponent cadr)

(define (make-exponent base expon)
  (cond ((= expon 0) 1)
        ((= expon 1) base)
  		(else (list '** base expon))))
  (define (deriv-exponent exp var)
     	(make-product 
      				(make-product 
      						(exponent exp)
      						(make-exponent base (- (exponent exp) 1) ))
                   (deriv (base exp) var)))
  (put 'deriv '** deriv-exponent))
  
  
;;;;;;;;;;
d)
; I don't quite understand what the question implies, but if we switched the indeces of the table we would simply swap the put function arguments.

