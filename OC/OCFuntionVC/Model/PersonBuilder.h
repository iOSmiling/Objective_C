//
//  PersonBuilder.h
//  OC
//
//  Created by 薛坤龙 on 2017/1/20.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "BaseModel.h"

@interface PersonBuilder : BaseModel

@property (nonatomic,strong,readonly) NSNumber *userID;
@property (nonatomic,strong,readonly) NSString *userName;
@property (nonatomic,strong,readonly) NSString *signature;

- (PersonBuilder *)userID:(NSNumber *)userID;
- (PersonBuilder *)userName:(NSString *)userName;
- (PersonBuilder *)signature:(NSString *)signature;

@end
