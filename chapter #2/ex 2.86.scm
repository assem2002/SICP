


;I made a great use out of the idea that our apply-generic now can raise your data type to the top of the tower
;and then it can down it if possible so i traverse thorugh the whole tower which saves my alot of implementation to write 
;when i wanted to write a trignometic procedures for the types in my system i just went up to the top and did the math on that type and drop back the result.



(define (install-trig-for-real)
  (define (cosine-real x) (make-real(cos x))) ; definition of real numbers isn't known so assume the previous implem.
  (define (sine-real x)  (make-real( sin x)))
  (define (atan2-real x y) (atan (/ y x) ))
  (define (squre-real x) (make-real (square x) 1))
  (define (square-root x) (make-rational (sqrt x) ))
  
  (put 'cosine '(real) cosine-real)
  (put 'sine '(real) sine-real)
  (put 'atan2 '(real real) atan2-real)
  (put 'square-mod '(real) square-real)
  (put 'sqrt-mod '(real) square-root))


(define (cosine x) (apply-genereic 'cosine x))
(define (sine x) (apply-genereic 'sine x))
(define (atan2 x y) (apply-genereic 'atan x y))

(define (install-complex-rectagular)
  (define (make-from-real-imag x y ) (cons x y) )
  (define (real-part z) car )
  (define (imag-part z) cdr)
  (define (angle z) (atan2 (imag-part z) (real-part z) ))
  (define (magnitude z) (sqrt-mod (add (square-mod (real-part z)) (square-mod (imag-part)) )) )
  ;start putting everything into the table.
  )

(define (add-complex z1 z2)
(make-from-real-imag (add (real-part z1) (real-part z2))
(add (imag-part z1) (imag-part z2))))
(define (sub-complex z1 z2)
(make-from-real-imag (sub (real-part z1) (real-part z2))
(sub (imag-part z1) (imag-part z2))))
(define (mul-complex z1 z2)
(make-from-mag-ang (mul (magnitude z1) (magnitude z2))
(add (angle z1) (angle z2))))
(define (div-complex z1 z2)
(make-from-mag-ang (div (magnitude z1) (magnitude z2))
(sub (angle z1) (angle z2))))



;conclusion of the previous exercises:

;we started the system by building for data types (integer,rational,real,complex),and we had selectors and constructors for each one which obeyed the data directed programming rule that forces us
;to tag our data whenever we construct them.
;then we wanted a way to coerce any type of them into the other one (was simple as it was (single sub,single sup) hierarchy) and we mangaed to embed this coercion into the apply-generic
;which gave us great capabilites such as (simplifying ,doing operation on any kind of don't matched data types)
;then we added the layer of abstraction that provide arithmtic operation on our system of numbers (add,sub,mul,div) which litterly works with any kind of data type
;then it asked us to do a little stupid thing but it showed us how great our system is built,it asked us to make a complex number out of one of its competetors (real,rational) 
;then we notice that our system is very generic,we can add to numbers easily or subtract or mul or ...; so all what we need to do is just make the implementation of the complex number generic 
;and even we wanted to code triagnomeric procedures as generic procedures we used to idea of coercion to simply coerce any type to supertype and implement small amount of the code
;which in fact opens our eyes to something even more interesting (we can simply implement the complex part for (add,sub,mul,div,cos,sin) and whenever we call something like add integer integer
;we just go up in the hirerarchy and do the job and drop the hirerarchy again.
;BASICALLY THE HIERARCHY HERE MADE US APLE OF THROWING AWAY EVERYTHING WE KNEW AND STICK WITH THE FACT THAT WE CAN JUST GO TO THE MOST GENERIC DATA TYPE AND OPERATE ON  IT AND DROP BACK.
