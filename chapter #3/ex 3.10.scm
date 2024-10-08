
(make-withdraw) -> is binded to a procedure object (pointer to body with parameter: inital-amount, pointer to the global environment)

whenever we start calling with-draw by passing an argument we create an enivorment
(make-withdraw 100) -> creates env1-> that has the following bindings (inital-amount:100) and then starts evaluating the body --> the body starts to decompose the let expression into lambda and which results in a
procedure object and then it call that object with argument passed as 100 which creates and env2 with the following bindings (balance:100) and then it creates a procedure object that points to a body with 
parameter amount 

(w1 (make-withdraw 100)) --> after evalutating the make-withdraw procedure we have w1 points to a procedure object which is the deepest procedure in the code,
so when we call it, it builds new environment (env3 for now)  which point to env2 which has the local state balance the env3 starts to mutate,while the env1 that has the inital-amount not getting changed 
at all(-though env3 can access it-),because the set! procedure just mutates what's binded to variable balance.
