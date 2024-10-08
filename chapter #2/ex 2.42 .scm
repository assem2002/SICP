
(define (adjoin-positions r c board)
  (cons (list r c) board ))

(define (safe? k positions )
  ;(newline)
  ;(display positions)
  (define (iter lookup l)
    (cond( (null? l ) true ) 
         ((= (car lookup) (car (car l)) )false)
         ((= (cadr lookup) (car(cdr(car l))) ) false)
         ((= (+ (car (car l))(car(cdr(car l)))  ) (+(car lookup)(cadr lookup)))  false)
         ((= (- (car (car l))(car(cdr(car l)))) (-(car lookup)(cadr lookup))) false)
         (else (iter lookup (cdr l) ) )
        )
    )
  (iter (car positions) (cdr positions))
  )


(safe? 1 '((1 3)(3 7)))

(define (queens board-size)
(define (queen-cols k)
(if (= k 0)
(list '())
(filter
(lambda (positions) (safe? k positions))
(flat-map
(lambda (rest-of-queens)
(map (lambda (new-row)
(adjoin-positions
new-row k rest-of-queens))
(enumerate 1 board-size)))
(queen-cols (- k 1))))))
(queen-cols board-size))
(queens 8)

