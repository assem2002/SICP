
(cons 1.0 (promise to improve (sqrt-stream x)))
|
|__> if you ask for cdr ---> **New (cons 1.0 (promise to improve (sqrt-stream x))) --> the car of this gets pushed to the first one resulting in (cons 1.0 (cons 1.0  (promise to improve (sqrt-stream x)) ))
	 |
	 |__> if your ask for another cdr -->****New (cons 1.0 (promise to improve (sqrt-stream x))) --> this will be push to **New resulting in  (cons 1.0 (cons 1.0  (promise to improve (sqrt-stream x)) )) which 
	 		will be push to the main one resulting in (cons 1.0 (cons 1.0(promise to improve (sqrt-stream x)))) 
	 		
and so on.


removing memoziation will lead to no differnce as the stream gets generated out of saved cdr of the guesses sequence so memoziation doesn't play a great rule in here.
