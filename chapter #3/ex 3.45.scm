
exchange procedure when called both acc1 and acc2 will be operating on the procedure and will be do nothing else but this procedure till it get done.
the problem arises when exhcange procedure start make withdraw and deposit from acc1 and acc2, these two proecure will never return a value untill exchange itself has done its work.
so the program will never return.
