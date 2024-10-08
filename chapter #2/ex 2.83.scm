
(define (install-raise)
  (define (raise-interger-to-rational i) (make-rational i 1))
  (define (raise-rational-to-real x) (make-real x)) ; some magic procedure i don't care about
  (define (raise-real-to-complex x) (make-from-real-imag x 0))
  (put 'raise '(integer) raise-interger-to-rational)
  (put 'raise '(rational) raise-rational-to-real)
  (put 'raise '(real) raise-real-to-complex))

(define (raise data) 
  ((get 'raise (get-tag data)) (content data)))
; we could use apply-generic.


