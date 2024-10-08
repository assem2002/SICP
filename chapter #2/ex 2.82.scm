
;I assume that get-coercion sends a false signal if there's no match.
;Pray with me there won't be no syntax errors here.
(define (apply-genreic op . args)
  (define (all-tags-same? tags)
    (if (null? (cdr tags)) true
        (if (eq? (car tags) (cadr tags)) (all-tags-same? (cdr tags))
             								false ))
  (define (check-all-valid? coercion-list)
    (if (null? coercion-list) true 
        (and (car coercion-list) 
             (check-all-valid? (cdr coercion-list)))))
  
  (define (get-coerced to-tag from)
    ( if (eq? to-tag (get-tag from)) from 
    		(let ((proc-coercion (get-coercion (get-tag from) to-tag)))
      				(if proc-coercion (proc-coercion from)
          								false ))))
  
  (define (coerced-then-go tag) 
    (let ((coerced-list (map (lambda (x) (get-coerced tag x)) args)))
      (if (check-all-valid coerced-list) (apply apply-generic (append '(op) coerced-list ))
          								false )))
  
  (let ((tags-only (map get-tag args))
        (content-only (map get-content args)))
    (let ( (proc (get op tags-only)) ) 
      (if proc 
          (apply proc content-only)
		  (if (not(all-tags-same)) (accumulate and true (map coreced-then-go tags-only)))
          							false)))))
;if we assume we have a clock system and it has a procedure (make-time hours minutes) -> it prints this way (HH::MM)
;internally in just deals with hours and minutes data types to construct the time
; if you pass to it (make-time minutes hours ) it will fail to find the procedure so a coercion will get invoked
; if you coerce to single type only it will try (make-time hours hours) and (make-time minutes minutes) which are both return to valid procedure from the table.
  
  )

