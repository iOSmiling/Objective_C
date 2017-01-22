//
//  PersonModel.m
//  OC
//
//  Created by 薛坤龙 on 2017/1/20.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

- (instancetype)initWithUserID:(NSNumber *)uid
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    _userID = uid;
    return self;
}

- (instancetype)initWithUserBuilder:(PersonBuilder *)builder
{
    self = [super init];
    if (!self)
    {
        return nil;
    }
    _userID = builder.userID;
    _userName = builder.userName;
    _signature = builder.signature;
    
    return self;
}

@end
