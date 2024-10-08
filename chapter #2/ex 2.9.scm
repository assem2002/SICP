

(define (max a b)(if (> a b) a b))
(define (min a b)(if (< a b) a b))





(define (make-interval a b) (cons a b))
(define (lower-bound interval) (min (car interval) (cdr interval)))
(define (upper-bound interval) (max (car interval) (cdr interval)))
(define iter1 (make-interval 3 4) )
(define iter2 (make-interval 2 7))

(define (add-interval x y)
(make-interval (+ (lower-bound x) (lower-bound y))
(+ (upper-bound x) (upper-bound y))))

(define (add-interval-modified x y i )
	(add-interval (make-interval (*(lower-bound x) i)
                   (*(upper-bound x) i))
	(make-interval (*(lower-bound x) i)
                   (*(upper-bound x) i)))
  )
 ;it's seems weird but, it's just arthimtic intervals subtraction.
(define (sub-interval a b )
  (make-interval (- (lower-bound a) (upper-bound b))
                 (- (upper-bound a) (lower-bound b))
                 ))

(define (width a mul)
  (/ (-(* (upper-bound a) mul)(* (lower-bound a) mul)) 2))

(define (test iterations i)
  (cond (( = iterations 0) (display "finish")) 
     (else (display (width iter1 i)) 
      (display " ***** ")
      (display (width iter2 i))
      (display " ***** ")
      (display (width (add-interval-modified iter1 iter2 i ) 1))
      ( newline)
      (test (- iterations 1) (+ i 1 ))
     )))


(test 5 1)
; you notice from the results that there's a relationship (you can prove it mathemtically)

