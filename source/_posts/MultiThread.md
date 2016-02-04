title: MultiThread
date: 2016-01-06 19:00:24
tags: 
---
# MultiThread

## 互斥量序列化线程操作顺序
Mutexes are typically used to serialise access to a section of  re-entrant code that cannot be executed concurrently by more than one thread.

<!--more-->
## 对比区别

### 临界区 和 信号量
***For Windows, critical sections are lighter-weight than mutexes.***

Mutexes can be shared between processes, but always result in a system call to the kernel which has some overhead.

Critical sections can only be used within one process, but have the advantage that they only switch to kernel mode in the case of contention - Uncontended acquires, which should be the common case, are incredibly fast. In the case of contention, they enter the kernel to wait on some synchronization primitive (like an event or semaphore).

### 信号量就是多个互斥量。
[Quora Link](https://www.quora.com/What-is-the-difference-between-a-mutex-and-a-semaphore)

![02~01_13-59-28.png](http://7xpvdr.com1.z0.glb.clouddn.com/02~01_13-59-28.png)


### CreateEvent and SetEvent and ResetEvent and WaitForSingleEvent
我现在比较直观的理解的方式就是
CreateEvent 表示创建对象。
SetEvent 表示设置信号量为一个有灯的状态在这个状态, WaitForSingleEvent 不再挂起, 开始往下执行。

SetEvent 设置有灯状态, ResetEvent设置无灯状态。
