


;start of data representation of rational numbers.

(define (gcd a b) 
  (if (= b 0)
      a
      (gcd b (remainder a b) )
      ))

(define (make-rat x y)
  (define (makeNormalized ) (if (or (and (< x 0 )(< y 0)) (and (> x 0 )(> y 0)) )
                                1 
                                -1))
  (let ((g (gcd (* (makeNormalized) x) ( abs y) )))
    (cons (/ (* (makeNormalized) x) g)
          (/ ( abs y) g)) ))

(define (numer x) 
  (car x))

(define (domen x)
  (cdr x))
;end of the representation.

(define (sum-rat x y)
  (make-rat (+(*(numer x)(domen y )) (*(numer y)(domen x)))
            (*(domen x)(domen y))))


(define (mul-rat x y) 
  (make-rat (*(numer x)(numer y))
            (*(domen x)(domen y))) )
(define half (make-rat -3 -4))
(define quarter (make-rat 5 5))
(mul-rat half quarter)


ex.2.2



(define (make-point x y)
  (cons x y))
(define (getX point)
  (car point))
(define (getY point)
  (cdr point))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(define (make-segment p1 p2)
  (cons p1 p2))
(define (start-seg segLine)
  (car segLine))
(define (end-seg segLine)
  (cdr segLine))

; Try to make a layer of abstraction between the points and the segemnt just for the sake of making a barrier (there's better solution for it btw)

(define (getXofPoint p)
  (getX p))
(define (getYofPoint p) 
  (getY p))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (getmid-seg segline)
  (let((p1 (start-seg segline)) (p2 (end-seg segline)))
    (make-segment (/ (+(getXofPoint p1)(getXofPoint p2))2)
       (/(+(getYofPoint p1)(getYofPoint p2))2)) 
    ))
(define seg (make-segment (make-point 1 5) (make-point 5 10)))
(getmid-seg seg)


