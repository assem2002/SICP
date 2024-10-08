
recursive way:

would build environment for the every call to the factoral procedure

env.1 -> (factorial 6)
env.2 -> (factorial 5)
env.3 -> (factorial 4)
env.4 -> (factorial 3)
env.5 -> (factorial 2)
env.6 -> (factorial 1)
when it reaches to base case ,it will just start to return the results and evaluating the (* n (factorial (- n 1 ))) part till it hit the env1 then it returns you the value (how the return from env2 up to env6 is handled implictly is still a hidden thing for us).
interative way:

env.1 -> (factorial 6)
env.2 -> (factorial-iter 1 1 6)
env.3 -> (factorial-iter 1 2 6)
env.4 -> (factorial-iter 2 3 6)
env.5 -> (factorial-iter 6 4 6)
env.6 -> (factorial-iter 24 5 6)
env.7 -> (factorial-iter 120 6 6)
env.6 -> (factorial-iter 720 7 6)

If the interperter does its optimization and won't build a stack overhead , this could lead to env1 and env2 gets created and then deleted and created again with new parameters.
