


(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10))
(define uk-inver (list  10 20 50 100))


(define (no-more? x) (null? x))
(define (first-denomination l)(car l))
(define (except-first-denomination l) (cdr l))

(define (cc amount coin-values)
(cond ((= amount 0) 1)
((or (< amount 0) (no-more? coin-values)) 0)
(else
(+ (cc amount
(except-first-denomination
coin-values))
(cc (- amount
(first-denomination
coin-values))
coin-values)))))
(cc 100 uk-inver)
(cc 100 uk-coins)


ex.2.20
;This Solution has a flaw with a list of size less than 3,but could be handled easily with if statement. 



(define (jumping l)  (if (or (null? (cdr l)) (null? (cdr (cdr l))) ) (cons (car l) nil)
                          (cons (car l) (jumping (cdr(cdr l)))) ))


(define (giveMe y )(cond ((even? y) cdr) (else (lambda (x) x)) ))
(define (same-parity m . w)
  (cons  (car((giveMe m) w)) (jumping (cdr (cdr ((giveMe m)w) )))))
 
(same-parity 1 2 3 4 5 6 7 8 9)

 
