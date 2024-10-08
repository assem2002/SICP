



(define (last-pair l)
  (if(null? (cdr l)) l
     (last-pair (cdr l))))

(define (reverse l)
  (define (reverse-internal l catch)
    (if (null? l) catch
        (reverse-internal (cdr l) (cons (car l) catch))
        ))
      (reverse-internal (cdr l) (cons (car l) nil)))

(reverse (list 1))



