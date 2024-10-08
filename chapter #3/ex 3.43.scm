account 1 -> 30
account 2 -> 20
account 3 -> 10

-If the following process happens 'account1 withdraw' --> 'account2 withdraw' --> 'account2 deposit' --> 'account 3 depoist'.
This will result in the following balances --> (20,20,20).
which violates the presumed balances, but still has the same amount of money which is 60.

- If exchange procedure got invoked on an object that doesn't use serialization, this would result in the following possibilties:
 balances in order (20,30,20)
 				   (20,10,20)

the problem essentially happens from the reading of balance local state in account 2 as it's the account that has two opreations happening concurrently.

