
(define (make-semaphore)
  (let ((mutex (make-serializer))
        (procedures (list '())) ;queue here is prefered
        (args (list '()))
        (n 10))
   		(define (pusher)
          (if (not(null? procedures)) 
          (begin ((apply (mutex (car procedures)) (car args))) 
                 (set! procedures (cdr procedures))
                 (set! args (cdr args))
                 (pusher))))
    	(define (func p . args_)
          (if ( = (length procedure) n) (apply func (cons p args_))
              (begin (set! procedures (cons p procedures))
                     (set! args (cons  args_ args))
               (if (null? procedures) (pusher)))))
    	func))

