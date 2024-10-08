
(define (count-leaves t)
(accumulate + 0 (map (lambda (x) (if (pair? x) (count-leaves x) 1 )) t)))

(count-leaves (list 1 (list 2 3 4 5) 6 7 (list 8 (list 9 10))) )



