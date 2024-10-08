 
 (define (below painter1 painter2)
  (lambda (frame) (((transform-painter painter1 (make-vec 0 0) (make-vec 1 0)(make-vec 0 0.5)) frame) 
                   ((transform-painter painter2 (make-vec 0 .5) (make-vec 1 .5)(make-vec 0 1)) frame) 
                   )
    )
  )
(define (below painter1 painter2)
  (deg90(beside(deg270 painter1) (deg270 painter2))))
 
 ---------------------------------------------
