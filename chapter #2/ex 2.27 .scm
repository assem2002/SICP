
(define (custom-reverse l)
  (define (iter l catch)
   (cond( (null? l) catch )
        ((pair? (car l)) (iter (cdr l) (cons (iter (car l) nil) catch)))
       (else (iter (cdr l) (cons (car l) catch)))))
  (iter l nil))
 

(custom-reverse (list (list 1 2) (list 3 4) (list 5 6)))


