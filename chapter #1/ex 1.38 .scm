


(define (cont-frac n d k)
 (define (helper result k)
   (if (= k 0) (- result (d 88)) 
       (helper (+ (d 99) (/(n 88) result))(- k 1))))
  (helper 1 k))
(cont-frac (lambda (i) 1.0)
(lambda (i) 1.0)
10)
