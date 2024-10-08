
(stream-ref y 7) -> 136

filter of even would go like this ---> 1 3 6 10 15 21 28 36 45 55 66 78 91 105 120 136

(display-stream z) --> if seq doesn't have in delay in seq untill it reaches 136 which is number 16 ---> the process would like that ->1 3 6 10 15 21 28 36 45 55 66 78 91 105 120 136 153 171 190 and then stops
if doesn't memoize it will stop at 10
