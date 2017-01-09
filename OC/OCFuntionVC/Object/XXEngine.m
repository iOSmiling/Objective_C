//
//  XXEngine.m
//  OC
//
//  Created by 薛坤龙 on 2017/1/9.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "XXEngine.h"

typedef void (^SUCCESSBLOCK)(BOOL isSuccess);
typedef void (^FAILEDBLOCK)(BOOL isSuccess);

@interface XXEngine()
@property(nonatomic,copy) SUCCESSBLOCK successBlock;
@property(nonatomic,copy) FAILEDBLOCK failedBlock;
@end

@implementation XXEngine

-(instancetype)init
{
    if (self = [super init])
    {
        NSLog(@"XXEngine init");
    }
    return self;
}

-(void)dealloc
{
    NSLog(@"XXEngine dealloc");
}

/*
 在（1）中，success是一个NSGlobalBlock对象，dispatch对success做了持有操作，GCD我们可以认为是一个系统单例对象，此时XXEngine虽然被释放了，但是success被GCD持有了一份，也就是引用技术+1，所以success这个block不会被释放。GCD持有的对象会被拷贝到堆中，现在GCD执行完成，堆中对象要进行释放，所以知道success完成后，GCD释放。Block可以回调的。
 
 在（2）中，GCD对XXEngine进行了持有，也就是引用技术+1，此时ViewController执行完对XXEngine引用技术-1，但是还是无法释放XXEngine，等到GCD结束之后，对XXEngine引用技术-1，此时会进行XXEngine的dealloc
 */

// 1:
- (void )testGlobalBlock:(NSString*) url
                 success:(void (^)(BOOL isSuccess))success
                 failure:(void (^)(BOOL isSuccess))failure
{
    //设置时间
    double delayInSeconds = 2.0;
    dispatch_time_t delayInNanoSeconds =
    dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(delayInNanoSeconds, concurrentQueue, ^(void){
        NSLog(@"网络操作完成");
        if(success)
        {
            NSLog(@"%@",success);
            success(YES);
        }
    });
}

// 2
- (void )testMallocBlock:(NSString*) url
                 success:(void (^)(BOOL isSuccess))success
                 failure:(void (^)(BOOL isSuccess))failure
{
    self.successBlock = success;
    self.failedBlock = failure;
    
    //设置时间
    double delayInSeconds = 2.0;
    dispatch_time_t delayInNanoSeconds =
    dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    
    dispatch_queue_t concurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(delayInNanoSeconds, concurrentQueue, ^(void){
        NSLog(@"网络操作完成");
        if(self.successBlock)
        {
            NSLog(@"%@",self.successBlock);
            self.successBlock(YES);
        }
    });
}

@end
