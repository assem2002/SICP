 
 
 (define (square x)(* x x))
(define (gcd x y)
  (if (= y 0) x (gcd y (remainder x y))))



(define (smallest-divisor n) (find-divisor n 2))
(define (find-divisor n test-divisor)
(cond ((> (square test-divisor) n) n)
((divides? test-divisor n) test-divisor)
(else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
(= n (smallest-divisor n)))




(define (accumulator filter combine null-value term a next b)
  (cond ((> a b) null-value)
        ((filter a) (combine (term a) (accumulator filter combine null-value term (next a ) next b )))
        (else (combine null-value (accumulator filter combine null-value term (next a ) next b )) )))

(define (tt x) x)
(define (nn x) (+ x 1))
(accumulator  prime? + 0 square 0 nn 10)


(define (realtive-primes n)
  (define (gcd-filter x) (= 1 (gcd x n))  )
  (accumulator gcd-filter * 1 tt 1 nn n))

(define (accumulator-iter combine null-value term a next b)
  (define (acc-helper a result)
    
    (if (> a b) result
        (acc-helper (next a ) (combine result (term a )) )))
  (acc-helper a null-value))


(accumulator-iter + 0 tt 1 nn 10)
(gcd 2 4)
(realtive-primes 10)
