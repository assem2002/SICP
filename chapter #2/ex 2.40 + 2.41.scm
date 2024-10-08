


(define (enumerate start finish )
  (if (< finish start ) nil
      (cons start (enumerate (+ start 1) finish))))

(define (flat-map procedure s)
  (accumulate append nil (map procedure s)))
(define (unique-pair n)
(flat-map (lambda (x) (map (lambda (y) (list x y))(enumerate 1 (- x 1 )) )) 
 (enumerate 1 n) ))

(define (get-triples n k) ;deduce the third number from the first two numbers.
(flat-map (lambda (x) (let((first (car x)) (second (cadr x)) (third (- k (car x) (cadr x)) ))
                       (if (or (< third 0)(> third n ) (= third first ) (= third second )) nil (list(list first second third)) )) ) 
 (unique-pair n))
  )
(get-triples 50 30)

