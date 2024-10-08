
(define (look-up given-key given-Tree)
  (cond ((null? given-Tree ) false)
        ((= given-key (key (car given-Tree))) (car given-Tree))
        ((< given-key (key (car given-Tree))) (look-up given-key (left-branch given-Tree)))
        ((> given-key (key (car given-Tree))) (look-up given-key (right-branch given-Tree)))
   ))
   
