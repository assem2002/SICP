
;The division must supply an install procedure to place its own functions in the divison system table
;The file provided should have its first element the name of the division or a code of the divison (ID)

;you can apply your specific apply prodcedure as the apply generic provided here won't work.
;or you can make the installation based on type of two arguments which honestly doesn't make any sense.

(define div-name car)
(define div-data cadr)

(define (get-record div-file employee-name)
  (let ((proc (get 'get-record (div-name div-file) )))
    (if proc (list (div-name div-file)(proc (div-data div-file) employee-name  )) false )))
;employee-record is represented as a tagged data,so i can use "apply-generic". 
(define (get-salary employee-record)
  (apply-generic 'get-salary employee-record))

(define (find-employee allFiles employee-name)
  (if (null? allFiles) false 
      (or (get-record (car allFiles) employee-name) (find-employee (cdr allFiles) employee-name))))

;when we add new personnel divison into the system all what it wants to just do a put of the procedures it uses into the table of (operations and division-Name)
