
make-account when defined the global environment binds the name of "make-account" to the procedure object which has two pointers one points to the global environment and the other one points to the body.

when called it starts to to bind the parameter balance to the argument passed and in that env. it has three bindings (withdraw,diposit,dispatch) and just the procedure object is passed as a return.

when you start to pass a message to that return (dispatch procedure) it starts to give you the result of whateveer procedure you choose, and whatever the procedure you choose it just mutate the balance whithin the env1.

mainly the make-account when called makes a env. and whenever you do a withdraw or a deposit it just created a new env and handles the body then return the variable and the just created env get deleted or becomes irrelavent to the model of evalution we are using at the moment.

