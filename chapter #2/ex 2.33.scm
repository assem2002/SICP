


(define (accumulate op finisher seq)
  (if (null? seq) finisher 
      (op (car seq) (accumulate op finisher (cdr seq)))
      )
  )
  
  
(define (map p sequence)
(accumulate (lambda (x y) ( cons (p x) y )) nil sequence))
(map square (list 1 2 3))



(define (append seq1 seq2)
(accumulate cons seq2 seq1))

(define (length sequence)
(accumulate (lambda (x y) (+ 1 y)) 0 sequence))

  
