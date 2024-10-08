
if balance is protected resource,and we have a function that gets the minimum number in all accounts (this function is embdeed in all the accounts and they just loop on list of accounts in a recursive way).
two accesses to this function would lead to deadlock as the the recursive proccess may get interrupted in the middle of evaluating the minimum balance.

