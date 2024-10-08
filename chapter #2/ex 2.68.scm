
(define (exist? theSet symbol)
  (cond((null? theSet) false)
       ((equal? (car theSet) symbol) true)
       (else (exist? (cdr theSet) symbol)))
       )

(define (whichBranch tree symbol)
  (cond ( (exist? (symbols (left-branch tree) ) symbol) (list 0 (left-branch tree)) )
         ((exist? (symbols (right-branch tree)) symbol) (list 1 (right-branch tree)) )
        (else (error  "the symbol isn't represented in the list so far " ) )
  ))


(define (encode-symbols symbols-list tree)
  
  (define (insider currentList currentNode)
    (cond ((null? currentList ) nil)
          ((leaf? currentNode) (insider (cdr currentList) tree) )
          (else    
    			(let ((Tree-bit 
                               (whichBranch currentNode (car currentList) ) ))
       
      (cons (car Tree-bit) (insider currentList (cadr Tree-bit) )
            ))
    
    
  )))
  (insider symbols-list tree)
  
)

