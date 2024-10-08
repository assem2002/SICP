 
 
 
(define (split  bigcombine smallcombine)
  (define (splitrec painter n) 
    (if (= n 0) painter 
        (let((small (splitrec painter (- n 1))))
          (bigcombine painter (smallcombine small small) ) ))
    )
  )
  
  
