

(define (cont-frac n d k)
  (if (= k 0) 0 (/ (n 1) (+ (d 1) (cont-frac n d (- k 1)))) ))
(cont-frac (lambda (i) 1.0)
(lambda (i) 1.0)
11)

