
(define (install-equ-for-all-implementations)
  (define (equ?-ordinary x y) (= x y))
  (define (equ?-rational x y) (eq? x y))
  (define (equ?-complex x y) (and (= (real-part x) (real-part y)) 
                                  (= (imag-part x) (imag-part y))))
  (put 'equ? '(scheme-number scheme-number) equ?-ordinary)
  (put 'equ? '(rational rational) equ?-rational)
  (put 'equ? '(complex complex) equ?-complex))

(define (equ? x y) (apply-genreic 'equ? x y ) )

