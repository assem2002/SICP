

(define (dot-product v w)
(accumulate + 0 (map-extended * v w)))


(define (matrix-*-vector m v)
(map (lambda(x) (dot-product x v)) m))

(define (transpose mat)
(accumulate-n cons nil mat))


(matrix-*-vector (list (list 1 2 3) (list 4 5 6) (list 7 8 9)) (list 2 2 2))

(transpose (list (list 1 2 3) (list 4 5 6) (list 7 8 9)))

(define (matrix-*-matrix m n)
(let ((cols (transpose n)))
(map (lambda (x) (map (lambda (y) (dot-product x y)) cols) ) m)))

(matrix-*-matrix (list (list 1 2 3) (list 4 5 6) (list 7 8 9)) (list (list 1 2 3) (list 4 5 6) (list 7 8 9)) )

