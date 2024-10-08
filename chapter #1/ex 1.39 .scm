
(define (cont-frac n d k)
 (define (helper result k)
   (if (< k 0) result 
       (helper (+ (d k) (/(n k) result))(- k 1))))
  (helper (d k) (- k 1)))




(define (tanFunction x k)
  (cont-frac
   (lambda (i) (if (= i 0) x (* (* x x) -1)))
   (lambda (x) (if(= x 0) 0 (+ x (- x 1))))
             k ))


(tanFunction 1 8)


