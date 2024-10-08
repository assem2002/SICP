
(define (make-vec x y) (cons x y) )
(define (xcor-vec vec) (car vec))
(define (ycor-vec vec) (cdr vec))
(define (add-vec v1 v2) (make-vec (+ (xcor-vec v1) (xcor-vec v2))
                                  (+(ycor-vec v1)(ycor-vec v2))))

(define (sub-vec v1 v2) (make-vec (- (xcor-vec v1) (xcor-vec v2))
                                  (- (ycor-vec v1)(ycor-vec v2))))

(define (scale-vec factor v) (make-vec (* factor (xcor-vec v))
                                       (* factor (ycor-vec v))) )
