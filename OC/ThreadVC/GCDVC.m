//
//  GCDVC.m
//  OC
//
//  Created by 薛坤龙 on 2016/12/20.
//  Copyright © 2016年 sigboat. All rights reserved.
//

#import "GCDVC.h"

#import <AFNetworking.h>

@interface GCDVC ()
{
    dispatch_queue_t socketQueue;
    
    AFNetworkReachabilityManager *manager;
    
}

@end

@implementation GCDVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationItem.title = @"GCD";
    
    manager = [AFNetworkReachabilityManager sharedManager];
    __weak typeof(self) weakSelf = self;
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
    {
        /*
        // 一共有四种状态
        switch (status)
        {
            case AFNetworkReachabilityStatusNotReachable:
                
                NSLog(@"AFNetworkReachability Not Reachable");
                
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                NSLog(@"AFNetworkReachability Reachable via WWAN");
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                
                NSLog(@"AFNetworkReachability Reachable via WiFi");
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                
            default:
                NSLog(@"AFNetworkReachability Unknown");
                break;
        }
         */
       
        if (status != AFNetworkReachabilityStatusNotReachable)
        {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [weakSelf reconnect];
            });
        }
    }];
    
    [manager startMonitoring];
    
    
    //GCD
    
    /*
     
     //dispatch_queue_create(const char *label, dispatch_queue_attr_t attr);
     
     NOTE: dispatch_queue_attr_t设置成NULL的时候默认代表串行。
     
     */
    
    //串行队列
    dispatch_queue_t serialQueue;
    serialQueue = dispatch_queue_create("com.example.SerialQueue", NULL);
    
    //并发队列
    dispatch_queue_t concurrentQueue;
    concurrentQueue = dispatch_queue_create("com.example.ConcurrentQueue", DISPATCH_QUEUE_CONCURRENT);
    
    //main队列
    dispatch_queue_t mainQueue;
    mainQueue = dispatch_get_main_queue();
    
    
    
    dispatch_queue_t myCustomQueue;
    myCustomQueue = dispatch_queue_create("com.example.MyCustomQueue", NULL);
    //异步执行
    dispatch_async(myCustomQueue, ^{
        NSLog(@"Do some work here.");
    });
    //同步执行
    dispatch_sync(myCustomQueue, ^{
        NSLog(@"Do some more work here.");
    });
    
    /*
     dispatch_async在不同队列类型执行的情况
     
     1 自定义串行队列：当你想串行执行后台任务并追踪它时就是一个好选择。这消除了资源争用，因为你知道一次只有一个任务在执行。
     2 主队列：这是在一个并发队列上完成任务后更新 UI 的一般选择。
     3 并发队列：这是在后台执行非 UI 工作的一般选择
     */
    
    
}

- (void)reconnect
{
    //此处代码忽略...
    NSLog(@"网络变化，重连");
    
}

- (void)dealloc
{
    [manager stopMonitoring];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}



@end
