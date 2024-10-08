

'((key another-dimension) (left right))

(define (make-table same-key?)
  (define (assoc key records)
	(cond ((or (null? records) (not (pair? records)) ) false)
			((same-key? key (caar records)) (car records))
	(else (assoc key (cdr records)))))
  
  (define (assoc-binary key records) ; it gives you a pair and instructions to handle that pair (instruction-where-to-go pair)
    (cond ((or (null? (cdr records)) (not (pair? records))) (cons 'cdr records))
          ((< key (caar records)) (if (null? (cadr records)) (cons 'car (cdr records)) (assoc key (cadr records))))
          ((> key (caar records)) (if (null? (cddr records)) (cons 'cdr (cdr records))(assoc key (cddr records))))
          ((= key (caar records)) (cons 'cdr (car records)) )))
  
	(let ((local-table (list '*table*)))
	(define (lookup key-1 key-2)
		(let ((subtable
				(assoc key-1 (cdr local-table))))
		(if subtable
			(let ((record
			(assoc key-2 (cdr subtable))))
				(if record (cdr record) false))
				false)))
      
     (define (assoc-arbitrary keys-list) ;New modification.
       (define (iter current-key table)
         (if (null? current-key) table
         (let ((subtable (assoc (car current-key) (cdr table)))) 
           (if subtable
               	(iter (cdr current-key) subtable)
               (cons current-key table)))))
       (iter keys-list local-table))
      
      (define (lookup-arbitrary . keys) ;New modification.
        (set! keys (append keys '(value) ))
        (let ((res (assoc-arbitrary keys)))
          (if (null? (car res)) (cddr res)
              false)))
      
	(define (insert! key-1 key-2 value) 
		(let ((subtable
				(assoc key-1 (cdr local-table))))
			(if subtable
				(let ((record
				(assoc key-2 (cdr subtable))))
				(if record
					(set-cdr! record value)
					(set-cdr! subtable
							(cons (cons key-2 value)
								(cdr subtable)))))
			(set-cdr! local-table
				(cons (list key-1 (cons key-2 value))
				(cdr local-table)))))
	'ok)
      
     (define (insert-mod! value . keys) ;New modification.
       (set! keys (append keys '(value) ))
       (define (iter table)
         (let ((res (assoc-arbitrary keys))) 
           (let ((remaining-keys (car res))
                 (current-table (cdr res))) 
             (if (null? remaining-keys) (set-cdr! current-table value)
                 (begin (set-cdr! current-table 
                                  (cons 
                                   (cons (car remaining-keys) '())
                                   (cdr current-table)))
                        (iter  current-table)
                  )))))
       (iter local-table) 'ok)
      
	(define (dispatch m)
		(cond ((eq? m 'lookup-proc) lookup-arbitrary)
				((eq? m 'insert-proc!) insert-mod!)
		(else (error "Unknown operation: TABLE" ))))
	dispatch))

(define (predicate? lookup-key current-key) 
  (eq? lookup-key current-key ))

(define mytable (make-table predicate?))
((mytable 'insert-proc!) 55 '1  )
((mytable 'insert-proc!) 45 'a 'b 'c)
((mytable 'insert-proc!) 66 'a 'b 'l )

((mytable 'lookup-proc)'1)
((mytable 'lookup-proc)'a 'b 'c)
((mytable 'lookup-proc)'a 'b 'l)





 
