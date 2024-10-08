

(define (cube x)
  (* x x x))
(define (sum term a next b)
  (if(> a b) 0 
     (+ (term a)
        (sum term (next a) next b))))

(define (evaluate-h a b n)  (/ (- b a) n))

(define (simpson-intergral f a b n)
  (simpson-integral-helper f a b n (evaluate-h a b n)))

(define (simpson-integral-helper f a b n h)
  (define (myNext iter) (+ iter 1))
  (define (f-modified x ) (if (even? x) (* 2 (f (+ a (* x h)))) 
                              (* 4 (f (+ a (* x h))))))
  (* (/ h 3.0) (+ (f a) (sum f-modified 1 myNext (- n 1) ) (f b))))
(simpson-intergral cube 0 1 100)


