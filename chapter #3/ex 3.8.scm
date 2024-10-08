(define f
  (let ((flag 0))
    (lambda (x) (if (= x 0) flag 
                    (let ((oldflag flag))
                          (begin (set! flag 1) oldflag)) ))))
;(+ (f 0) (f 1)) -> 0
;(+ (f 1) (f 0)) -> 1
