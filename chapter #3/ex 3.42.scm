
From the original implementation, it seems that serializer work like a queue of procedure object and you can't operate on any procedure in this queue unless it's the front one of the whole queue.
The implementation in this problem seems to get a return from the serialzer and save it for further calls to the dispatch procedure. 
Potentially, both proteced-withdraw and protected-deposit are valid to use just only for the first time then they get removed from the queue and they wait for another insertion in the serialzer.

