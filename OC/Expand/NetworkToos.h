//
//  NetworkToos.h
//  OC
//
//  Created by 薛坤龙 on 2017/1/3.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

typedef NS_ENUM(NSInteger, NetWorkingState)
{
    UnknownWorking,//未知网络
    NoWorking, //无网络
    WifitWorking,//wifi
    WWANWorking, //手机自带网络
};

//成功回调
typedef void (^successBlock)(NetWorkingState status);

@interface NetworkToos : AFNetworkReachabilityManager

@property (nonatomic,assign) NetWorkingState state;

/**
 *  网络状态
 */
+ (void)LGwithSuccessBlock:(successBlock)success;

@end
