
(define (new-zero-installation)
  (define (=zero?-polynomial x) 
    (empty-termlist? (termlist x)))
  (put '=zero? 'polynomial =zero?-polynomial))
;The system witht the provided abstractions doesn't support a polynomial with empty terms,it would be just a problem if someone tried
;to make (explictly) a term list out of empty term-lists using the adjoin-term procedure the result would be a '() so we got to handle this
;situtation when we have such a weird user.

