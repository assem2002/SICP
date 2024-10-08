

(define fold-right accumulate)

(define (reverse sequence)
(fold-right (lambda (x y) (append y (list x)) ) nil sequence))
(define (reverse sequence)
(fold-left (lambda (x y) (append (list x) y) ) nil sequence))
(reverse (list 1 2 3))
