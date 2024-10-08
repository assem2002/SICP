
(define (attach-tag type-tag contents)
(cons type-tag contents))
(define (type-tag datum)
(cond( ((pair? datum) (car datum))
       ((number? datum) 'scheme-number)
   	   (else(error "Bad tagged datum: TYPE-TAG" datum)))))

(define (contents datum)
(cond( ((pair? datum) (cdr datum))
       ((number? datum) datum)
   	   (else(error "Bad tagged datum: CONTENTS" datum)))))


(define (install-scheme-number-package)
(put 'add '(scheme-number scheme-number) + )
(put 'sub '(scheme-number scheme-number) - )
(put 'mul '(scheme-number scheme-number) * )
(put 'div '(scheme-number scheme-number) / ))

; you can use the same "install-scheme-number-package" provided in the book with lambda functions
;just change the attach-tag to return a the same the content without combining the type scheme-number to the data.
