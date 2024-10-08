;data = '(complex rectangular 3 4)

;before adding the new entries into the table the following happens 
;  (apply-generic 'magnitude data ) --> invokes -->  (get 'magnitude 'complex ) --> which isn't in the table so ERROR invoked.

;After adding the new entries into the table the following happens
;  (apply-generic 'magnitude data ) --> invokes -->  (get 'magnitude 'complex ) --> return magnitude (the gerneric one)
; then... apply-generic completes its job.....
; (apply magnitude (rectagular 3 4)) --> which invokes -> (apply-generic 'magnitude (rectangular 3 4)) --> invokes --> (get 'magnitude 'rectangular) --> returns magnitude-rectangular
; then apply-generic (internal-one) completes its job.
; (apply magnitude-rectangular (3 4)) -> returns 3

; so apply-generic got invoked 2 times.

