//
//  PersonModel.h
//  OC
//
//  Created by 薛坤龙 on 2017/1/20.
//  Copyright © 2017年 sigboat. All rights reserved.
//

#import "BaseModel.h"
#import "PersonBuilder.h"

@interface PersonModel : BaseModel

@property (nonatomic,strong,readonly) NSNumber *userID;
@property (nonatomic,strong,readonly) NSString *userName;
@property (nonatomic,strong,readonly) NSString *signature;

- (instancetype)initWithUserID:(NSNumber *)uid;

- (instancetype)initWithUserBuilder:(PersonBuilder *)builder;

@end
