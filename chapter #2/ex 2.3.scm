

(define (make-point x y)
  (cons x y))
(define (getX point)
  (car point))
(define (getY point)
  (cdr point))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Rectangle making
;the rep
(define (create-rec p1 p2 p3)
  (cons (cons p1 p2) p3 ))
(define (height rec-obj)
  (abs (-(getX(car (cdr rec-obj))) ((getX(car (car rec-obj)))) ))
  )
(define (width rec-obj)
  (abs (-(getY(car (cdr rec-obj))) ((getY(cdr (cdr rec-obj)))) ))
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;This layer uses the with and height as interfaces,and you can implement those in so many different ways without violating the contract with the procedures below.
(define (calc-perimeter width height )
  (* 2 (+ height width)))

(define (calc-area width height)
  (* width height))




