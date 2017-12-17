newCachedThreadPool is  a  good  default  choice  for  an  Executor; better  queuing  performance  than  a  fixed  thread  pool. 

A fixed size thread pool is good for limiting the number of concurrent tasks for resource management  purposes

Bounding either the thread pool or the work queue is suitable only when tasks are independent. 

With tasks that depend on other tasks, bounded thread pools or queues can cause thread starvation deadlock; instead, use an unbounded pool configuration like newCachedThreadPool
