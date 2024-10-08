
(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    
    (define new-item '())
    
    (define (isempty?) (null? front-ptr))
    
    (define (insert item)
      (set! new-item (cons item '()))
      (cond ((isempty?) 
             (begin 
              (set! front-ptr new-item)
              (set! rear-ptr new-item)
              front-ptr))
            (else
             (begin (set-cdr! rear-ptr  new-item)
                    (set! rear-ptr new-item) 
                    front-ptr))))
    
    (define (delete-front)
      (cond ((isempty?) (error "queue is empty") )
            (else 
             (begin 
              (set! front-ptr (cdr front-ptr)) 
              front-ptr))))
    
    (define (get-front) (if (isempty?) 
                            (error "queue is empty")
                            (car front-ptr)))
    
    (define (print) front-ptr)
   
    (define (dispatch m)
      (cond ((eq? m 'insert) insert)  
            ((eq? m 'delete-front) delete-front)
            ((eq? m 'get-front) get-front)
            ((eq? m 'print) print)))
    
    dispatch))
    
; We can ovserve that the message passing technique is more like a the "dot notation technique in current programming languages" which you give some funtion you want depending on the current you pass the object from and it do the job.
; while the book technique of representing queues tends more to be have a data object in then pass it do some function to do operation on that object.
; they are both the same form the lower level point of view, but we're taking here about the convience of using the program.

