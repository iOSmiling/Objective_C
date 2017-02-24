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
 
}

@end

@implementation NetworkToos

+ (void)LGwithSuccessBlock:(successBlock)success
{
    [[self sharedManager]startMonitoring];
    
    [[self sharedManager]setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == 0)
        {
            success(NoWorking);
            
        }else if (status == 1)
        {
            success(WWANWorking);
        }else if (status == 2)
        {
            success(WifitWorking);
        }
    }];
}

@end
