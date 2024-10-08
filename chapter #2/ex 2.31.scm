


(define (tree-map-yourprocedure procedure l) ; I wrote the name of it as tree-map-yourprocedure cuz it's a little intuitve when you build the procedure that you either do the procedure you want or map over the tree (george's problems not mine to do )  
  (map (lambda (x) (if (pair? x) (tree-map-yourprocedure procedure x) (procedure x) )) l)
  )
(define (square-tree l) 
  (tree-map-yourprocedure square l))
(square-tree (list 1 2 (list 3 4)))

