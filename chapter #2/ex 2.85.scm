

;I assume that real data type takes to numbers and just divide them and get a decimal number

(define (install-raise)
  (define (raise-interger-to-rational i) (make-rational i 1))
  (define (raise-rational-to-real x) (make-real (numer x) (denom x) ) ) ; some magic procedure i don't care about
  (define (raise-real-to-complex x) (make-from-real-imag x 0))
  (put 'raise '(integer) raise-interger-to-rational)
  (put 'raise '(rational) raise-rational-to-real)
  (put 'raise '(real) raise-real-to-complex))

(define (raise data) 
  ((get 'raise (get-tag data)) (content data)))
; we could use apply-generic.

;Sorry, I interchanged the implemntation of project with the drop


(define (install-drop)
  (define (complex->real x) (make-real (real-part x) 1) )
  (define (real->rational x) (make-rational (quotient x 1) 1))
  (define (rational->integer x) (make-integer (/ (numer x) (denom x)) ))
  (put 'drop 'complex complex->real) ; type don't need to be a list (i won't use apply-generic)
  (put 'drop 'real real->rational)
  (put 'drop 'rational rational->integer))

(define (drop x) (get 'drop x))

(define (project x )
  (let ((proc(drop (get-tag x)))) 
    (if (not proc) x
        (let ((dropped (proc (content x)) )) 
          (if (equal? (raise dropped) x ) (project dropped)
              		x)))))


(define (apply-generic op . args)
  (define tower '(integer rational real))
  (define tower-up cdr )
  (define tower-base car )
  
  (define (tag-match? current-tag tags-only)
    (accumulate and true
     	(map (lambda (x) (eq? current-tag x) ) tags-only)))
  
  (define (lowest-in-tower-matcher tags-only) 
    (define (insider current-tower)
      (cond ((null? current-tower) false)
          	((tag-match? (tower-base current-tower) tags-only) (tower-base current-tower) )
            (else (insider (tower-up current-tower)))))
   (insider tower))
  
  (define (raise-this-only tag-to-raise)
    (map (lambda (x) (if (eq? tag-to-raise (get-tag x)) x
                         (raise x))) args))
  
  (let ((tags-only (map get-tag args))
        (content-only) (map content args))
    (let ((proc) (get op tags-only)) 
      (if proc project((apply proc content-only))
          		(let ((lowest-in-tower (lowest-in-tower-matcher tags-only))) 
                  (if lowest-in-tower (apply-gerneric op (apply (raise-this-only lowest-in-tower) ) )
                      					(error "we can't do this procedure there's no match")) )))))


