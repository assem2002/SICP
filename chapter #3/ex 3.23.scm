 
; I didn't change the name of the data strucure to dequeue, I just modified the previous queue.
; I used a doubly likned list ,where an item in the list is constructed like that --> (cons prev-item-ptr (cons item-value next-item-ptr))

(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '() ))
    
    (define new-item '())
    
    (define (isempty?) (or (null? front-ptr) (null? rear-ptr)) )
    
    (define (insert-rear item)
      (set! new-item (cons rear-ptr (cons item '())))
      (cond ((isempty?) 
             (begin 
              (set! front-ptr new-item)
              (set! rear-ptr new-item)
              (printer front-ptr)))
            (else
             (begin (set-cdr! (cdr rear-ptr)  new-item)
                    (set! rear-ptr new-item) 
                    (printer front-ptr)))))
    
    (define (insert-front item)
      (set! new-item (cons '() (cons item front-ptr)))
      (cond ((isempty?) 
             (begin 
              (set! front-ptr new-item)
              (set! rear-ptr new-item)
              (printer front-ptr)))
            (else
             (begin 
              (set-car! front-ptr new-item)
              (set! front-ptr new-item)
              (printer front-ptr)))))
    
    (define (delete-front)
      (cond ((isempty?) (error "queue is empty") )
            (else 
             (begin 
              (set! front-ptr (cddr front-ptr))
              (if (not (isempty?)) (set-car! front-ptr '()) (set! rear-ptr '()) )
              (printer front-ptr)))))
    (define (delete-rear)
      (cond ((isempty?) (error "queue is empty") )
            (else 
             (begin 
             	(set! rear-ptr (car rear-ptr))
              	(if (not (isempty?)) (set-cdr! (cdr rear-ptr) '()) (set! front-ptr '()) )
              	(printer front-ptr)))))
    
    
    (define (get-front) (if (isempty?) 
                            (error "queue is empty")
                            (cadr front-ptr)))
    (define (get-rear) (if (isempty?)
                           (error "queue is empty")
                           (cadr rear-ptr)))
    (define (printer current)
      (if (null? current) '()
          (cons (cadr current) (printer (cddr current)))))
       
    (define (dispatch m)
      (cond ((eq? m 'insert-rear) insert-rear)  
            ((eq? m 'delete-front) delete-front)
            ((eq? m 'get-front) get-front)
            ((eq? m 'get-rear) get-rear)
            ((eq? m 'print) (printer front-ptr))
            ((eq? m 'insert-front)insert-front)
            ((eq? m 'delete-rear) delete-rear )
            ((eq? m '1) front-ptr )))
    
    dispatch))

(define new (make-queue))
((new 'insert-rear) 'A)
((new 'insert-rear) 'B)
((new 'insert-rear) 'C)
((new 'insert-rear) 'D)
;((new 'insert-front) 'Z)
;((new 'insert-rear) 'B)
;((new 'insert-rear) 'C)
;((new 'print))
;((new 'insert-rear) 'D )
;((new 'get-front))
((new 'delete-front))
;((new 'delete-front))

((new 'delete-rear))
((new 'delete-front))
((new 'delete-front))
;((new 'insert-front) 'F)
((new 'insert-rear) 'D)
((new 'insert-front) 'B)
;(cddr(new '1))
((new 'delete-rear))
((new 'get-rear))

((new 'delete-front))
;((new 'get-front))


;((new 'print))

