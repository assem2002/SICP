
;flipped the data structure (it's ruined,but the idea works in constant space :)  )
(define (has-cycle? l)
  (define (internal prev cur)
    (cond 	((null? cur)false)
     		((eq? cur l) true)
           (else (let ((tempNext (cdr cur))) 
                   (begin (set-cdr! cur prev) (internal cur tempNext))))))

  (internal l (cdr l))
  )

