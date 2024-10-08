
Lisp interpeter handles the printing issue in a recursive way. When ever it finds a pointer to some data object it goes into it, If it's a pair data object that means we have pair of data object that needs to
be printed so it goes into the pointer of the first and print out the data (if it's primitve it prints right away, if a data object it recursive on the logic of priniting poitners)...then it goes to the second pointer and print it out .

The issue that queue is a pair of pointers the first points to the begining of the queue which prints the queue list as intended,but then it goes to the second data object of the queue pair and start print out what ever the data it finds in there (primitve or pointer). the second data object in the queue pair is pointing to the last element in the last,thus the data is printed that way.



(define (print) (front-ptr))
