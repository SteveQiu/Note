## Threads

newCachedThreadPool is  a  good  default  choice  for  an  Executor; better  queuing  performance  than  a  fixed  thread  pool. 

A fixed size thread pool is good for limiting the number of concurrent tasks for resource management  purposes

Bounding either the thread pool or the work queue is suitable only when tasks are independent. 

With tasks that depend on other tasks, bounded thread pools or queues can cause thread starvation deadlock; instead, use an unbounded pool configuration like newCachedThreadPool

## Concurrency

Single operation -> atomic short, int, reference ... for finer granularity

ReentrantLock -> high contention conditional operation

As  performance graphs  suggests,  at  high  contention  levels  locking  tends  to  outperform  atomic  variables,  but  at  more  realistic  contention levels atomic variables outperform locks

The rules for happens before are: 
 - Program  order  rule.  Each  action  in  a  thread  happens before  every  action  in  that  thread  that  comes  later  in  the  program order. 
 - Monitor lock rule. An unlock on a monitor lock happens before every subsequent lock on that same monitor lock.[3] 
 - Volatile variable rule. A write to a volatile field happens before every subsequent read of that same field.[4] 
 - Thread start rule. A call to Thread.start on a thread happens before every action in the started thread. 
 - Thread  termination  rule.  Any  action  in  a  thread  happens before  any  other  thread  detects  that  thread  has  terminated, either by successfully return from Thread.join or by Thread.isAlive returning false. 
 - Interruption rule. A thread calling interrupt on another thread happens before the interrupted thread detects the  interrupt (either by having InterruptedException thrown, or invoking isInterrupted or interrupted). 
 - Finalizer rule. The end of a constructor for an object happens before the start of the finalizer for that object. 
 - Transitivity. If A happens before B, and B happens before C, then A happens before C. 
  
  << java concurrency in practice >>
