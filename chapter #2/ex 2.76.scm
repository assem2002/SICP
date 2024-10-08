
;For a system that has lots of new operations added (selectors)
; Data-Directed Programming: would require all the different implementations to re install their new packages or make a custom install prcodeure for their new operations
; Explicit dispatch : will result in writing a whole clause procdure to dispatch the data to the appropritate implementation.
; Message Passing : will require nothing (just every one implements his own operation and add to the constructor ) , but this will lead to inconsistency in the system as the old data object wont have
;the new operations and passing the new message would lead to an error.

;For a system that has lots of new types get added to the system 
; Data-Directed programming : would require a single installation for the new package (NO names collision)
; Explicit dispatch : will force you to go through the different dispatch procedure and add a new single clause. (YES names collision)
; message passing : would require just a new implementation (NO names collision)


