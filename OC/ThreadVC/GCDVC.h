//
//  GCDVC.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "BaseViewController.h"

@interface GCDVC : BaseViewController

@end


/*

    1:串行任务就是每次只有一个任务被执行，
      并发任务就是在同一时间可以有多个任务被执行。
 
    2:同步函数意思是在完成了它预定的任务后才返回，在任务执行时会阻塞当前线程.
      异步函数则是任务会完成但不会等它完成，所以异步函数不会阻塞当前线程，会继续去执行下一个函数。
 
    3:并发的意思就是同时运行多个任务。  并发任务必须先运行一个线程，执行一个上下文切换，然后运行另一个线程或进程
      并行则是真正意思上的多任务同时运行。


 
    GCD有三种队列类型： 
 
    1:Serial :
             串行队列将任务以先进先出(FIFO)的顺序来执行，所以串行队列经常用来做访问某些特定资源的同步处理。
            你可以也根据需要创建多个队列，而这些队列相对其他队列都是并发执行的。换句话说，如果你创建了4个串行队列，
            每一个队列在同一时间都只执行一个任务，对这四个任务来说，他们是相互独立且并发执行的。如果需要创建串行队列，
            一般用dispatch_queue_create这个方法来实现。
 
    2:Concurrent :
             并发队列虽然是能同时执行多个任务，但这些任务仍然是按照先到先执行(FIFO)的顺序来执行的。并发队列会基于
            系统负载来合适地选择并发执行这些任务。在iOS5之前，并发队列一般指的就是全局队列(Global queue)，
            进程中存在四个全局队列：高、中(默认)、低、后台四个优先级队列，可以调用dispatch_get_global_queue函数传入优先级来访问队列。
            而在iOS5之后，我们也可以用dispatch_queue_create，并指定队列类型DISPATCH_QUEUE_CONCURRENT，来自己创建一个并发队列。
 
    3:Main dispatch queue
                与主线程功能相同。实际上，提交至main queue的任务会在主线程中执行。main queue可以调用dispatch_get_main_queue()来获得。
                因为main queue是与主线程相关的，所以这是一个串行队列。和其它串行队列一样，这个队列中的任务一次只能执行一个。
                它能保证所有的任务都在主线程执行，而主线程是唯一可用于更新 UI 的线程。
 
  队列的选择：
    当我们需要某些任务以指定的顺序去执行时，串行队列是一个非常好的选择。
 
 
 
*/
