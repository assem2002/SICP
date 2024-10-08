
(define (element-of-set? x set)
(cond ((null? set) false)
((= x (car set)) true)
((< x (car set)) false)
(else (element-of-set? x (cdr set)))))

(define (adjoin-element x set)
  (if (element-of-set x set) 
   (cons x set)
   set
   ))
;the unordered set will for sure test till it reach a duplicate item or the end of the set.
;while the ordered will stop if it reaches a duplicate of end of set or a number larger than the one we look for
;thus a set like (1 2 3 4 5 6 7 8 9) if you look for 5 by the second approach you will find it in n/2
;while the same set but not ordered (1 3 2 4 6 9 8 7 5) you' find the number in (n) time.
;still not effiecent enough but for sure has great chance of speeding up your program.


