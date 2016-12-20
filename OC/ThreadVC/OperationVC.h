//
//  OperationVC.h
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "OCBaseViewController.h"

@interface OperationVC : OCBaseViewController

@end

/*
 NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];  //主队列   凡是添加到主队列中的任务（NSOperation），都会放到主线程中执行
 
 NSOperationQueue *queue = [[NSOperationQueue alloc] init]; //自定义队列同时包含了：串行、并发功能,添加到这种队列中的任务（NSOperation），就会自动放到子线程中执行
 NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
 //任务执行
 }];
 [queue addOperation:operation];
 */


/*
 
 队列的取消、暂停、恢复
 
 // 恢复队列，继续执行
 // self.queue.suspended = NO;
 
 // 暂停（挂起）队列，暂停执行
 // self.queue.suspended = YES;
 
 // 取消队列的所有操作
 [queue cancelAllOperations];
 
 
 */



/*
 修改Operations的执行顺序
 对于添加到queue中的operations，它们的执行顺序取决于2点：
 1.首先看看NSOperation是否已经准备好：是否准备好由对象的依赖关系确定
 2.然后再根据所有NSOperation的相对优先级来确定。优先级等级则是operation对象本身的一个属性。
 默认所有operation都拥有“普通”优先级,不过可以通过setQueuePriority:方法来提升或降低operation对象的优先级。
 优先级只能应用于相同queue中的operations。如果应用有多个operation queue,每个queue的优先级等级是互相独立的。
 因此不同queue中的低优先级操作仍然可能比高优先级操作更早执行。
 注意：优先级不能替代依赖关系,优先级只是对已经准备好的 operations确定执行顺序。先满足依赖关系,然后再根据优先级从所有准备好的操作中选择优先级最高的那个执行。
 
 
 */

