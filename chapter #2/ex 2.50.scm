
(define (flip-horz painter) (transform-painter painter (make-vec 1 0)
                                               			(make-vec 0 0 )
                                               			(make-vec 1 1)
                                               ))
(define (deg180 painter) (transform-painter painter (make-vec 1 1)
                                               			(make-vec 0 1 )
                                               			(make-vec 1 0)
                                               ))
(define (deg270 painter) (transform-painter painter (make-vec 0 1)
                                               			(make-vec 0 0 )
                                               			(make-vec 1 1)
                                               ))
 
