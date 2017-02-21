//
//  NetworkToos.m
//  OC
//
//  Created by 薛坤龙 on 2017/1/3.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "NetworkToos.h"

@interface NetworkToos ()
{
    AFHTTPSessionManager *manager;
}

@end

@implementation NetworkToos

+ (instancetype)sharedManager
{
    static dispatch_once_t once;
    static id instance;
    dispatch_once(&once, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (instancetype)init
{
    if ((self = [super init]))
    {
        manager = [[AFHTTPSessionManager alloc] init];
        
        // 设置超时时间，afn默认是60s
        manager.requestSerializer.timeoutInterval = 30;
        // 响应格式添加text/plain
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain", nil];
        
        __weak typeof(self) weakSelf = self;
        
        // 监听网络状态,每当网络状态发生变化就会调用此block
        [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status)
        {
            switch (status)
            {
                case AFNetworkReachabilityStatusNotReachable:     // 无连线
                    NSLog(@"AFNetworkReachability Not Reachable");
                    
//                    weakSelf.state = NoWorking;
                    [weakSelf setState:NoWorking];
                    
                    break;
                case AFNetworkReachabilityStatusReachableViaWWAN: // 手机自带网络
                    NSLog(@"AFNetworkReachability Reachable via WWAN");
                    
                    weakSelf.state = WWANWorking;
                    
                    break;
                case AFNetworkReachabilityStatusReachableViaWiFi: // WiFi
                    NSLog(@"AFNetworkReachability Reachable via WiFi");
                    
                    weakSelf.state = WifitWorking;
                    
                    break;
                case AFNetworkReachabilityStatusUnknown:          // 未知网络
                    
                    weakSelf.state = UnknownWorking;
                    
                    break;
                default:
                    NSLog(@"AFNetworkReachability Unknown");
                    break;
            }
        }];
        
        NSLog(@"state %ld",(long)_state);
        
        // 开始监听
        [manager.reachabilityManager startMonitoring];
        
     
    }
    return self;
}

- (NetWorkingState)getState
{
    return _state;

}

@end
