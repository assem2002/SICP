initially the agenda has the following when wires(a1,a2) set to be a part of ang-gate:   (3,set-signal c 0) --> (3,set-signal c 0)
 

sitting the and-gate to be (0,1) will add the following into the agenda : (3,set-signal c 0)

so now we have the following in the agenda to be propagated :  (3,set-signal c 0) --> (3,set-signal c 0) --> (3,set-signal c 0)
this will result to c = 0 (whether using FIFO or LIFO) (stack or queue)

change wire singals to (1,0) will result in the following to be added into the agenda : (6,set-signal c 1) --> (6,set-signal c 0)

this will result in c =0  (if we use FIFO (queue))
and will result in c =1 (if we use LIFO (stack))
