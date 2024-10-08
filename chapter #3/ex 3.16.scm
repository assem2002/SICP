;(count-pairs (list 1 2 3) ) -> return 3 
;;;;;
;(define z (cons nil nil))
;(define y (cons z z))
;(define x (cons y y))
;(count-pairs x ) -> return 7
;;;;;

(define x (cons nil nil))
(define y (cons x x))
(set-car! x y)
(count-pairs x) -> no return (infinite recursion )
