//
//  NetworkToos.h
//  OC
//
//  Created by 薛坤龙 on 2017/1/3.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NetWorkingState)
{
    UnknownWorking,//未知网络
    NoWorking, //无网络
    WifitWorking,//wifi
    WWANWorking, //手机自带网络
};

#import "AFHTTPSessionManager.h"

@interface NetworkToos : NSObject

+ (instancetype)sharedManager;

@property (nonatomic,assign) NetWorkingState state;

- (NetWorkingState)getState;

@end
